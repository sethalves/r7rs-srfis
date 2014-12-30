(define-library (srfi-tests 106 tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (srfi 27)
          (srfi 106)
          (srfi 78))

  (begin

    (check-reset!)

    (random-source-randomize! default-random-source)

    (define port-no (number->string (+ (random-integer 20000) 10000)))

    (define (get-line-from-binary-port bin)
      (let loop ((result '())
                 (b (read-u8 bin)))
        (cond
         ((eof-object? b)
          (if (null? result)
              b
              (utf8->string (apply bytevector (reverse result)))))
         ((= b 10) ;; newline
          (utf8->string (apply bytevector (reverse result))))
         ((= b 13) ;; ignore carriage-return
          (loop result (read-u8 bin)))
         (else
          (loop (cons b result) (read-u8 bin))))))


    (define (echo-test)
      (let* ((echo-server-socket (make-server-socket port-no))
             (client-socket (make-client-socket "localhost" port-no)))
        (call-with-socket
         (socket-accept echo-server-socket)
         (lambda (sock)
           (let ((in (socket-input-port sock))
                 (out (socket-output-port sock)))
             (socket-send client-socket (string->utf8 "hello\r\n"))
             (let ((r (get-line-from-binary-port in)))
               (write-bytevector (string->utf8 (string-append r "\r\n")) out)
               (flush-output-port out)
               (let ((result
                      (socket-recv client-socket
                                   (string-length "hello\r\n"))))
                 (check (utf8->string result) => "hello\r\n"))))))))


    (define (run-tests)

      (check *msg-peek* => (message-type peek))

      ;; (check
      ;;  (message-type peek oob) =>
      ;;  (socket-merge-flags (message-type peek)
      ;;                      (message-type oob)))

      ;; (check
      ;;  (message-type oob peek) =>
      ;;  (socket-merge-flags (message-type oob)
      ;;                      (message-type peek)))

      ;; (check
      ;;  (socket-purge-flags
      ;;   (message-type peek oob)
      ;;   (message-type peek))  =>
      ;;   (message-type oob))

      (echo-test)

      (check-passed? 2))))
