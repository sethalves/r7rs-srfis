(define-library (srfi-tests 106 tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (srfi 27)
          (srfi 106)
          (srfi 78)
          )

  (cond-expand
   (gauche
    (import (gauche threads)))
   (else
    (import (srfi 18))))


  (begin

    (random-source-randomize! default-random-source)

    (define port-no (number->string (+ (random-integer 20000) 10000)))

    ;; simple echo server
    (define (echo-server-run)

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

      (let ((echo-server-socket (make-server-socket port-no)))
        (call-with-socket
         (socket-accept echo-server-socket)
         (lambda (sock)
           (let ((in (socket-input-port sock))
                 (out (socket-output-port sock)))
             (let lp2 ((r (get-line-from-binary-port in)))
               (cond
                ((eof-object? r) #t)
                (else
                 (write-bytevector (string->utf8 (string-append r "\r\n")) out)
                 (flush-output-port out)
                 (lp2 (get-line-from-binary-port in))))))))))


    (define (run-tests)

      (check *msg-peek* => (message-type peek))

      (check
       (message-type peek oob) =>
       (socket-merge-flags (message-type oob)
                           (message-type peek)))


      (check
       (message-type oob peek) =>
       (socket-merge-flags (message-type peek)
                           (message-type oob)))

      (check
       (message-type oob peek) =>
       (socket-purge-flags
        (message-type peek oob wait-all)
        (message-type wait-all)))

      (let ((server-thread (make-thread echo-server-run)))
        (thread-start! server-thread)
        (thread-sleep! 1)
        (let ((client-socket (make-client-socket "localhost" port-no)))
          ;; simple echo client
          (socket-send client-socket (string->utf8 "hello\r\n"))
          (thread-sleep! 1) ;; bug in chibi requires this
          (let ((result
                 (utf8->string
                  (socket-recv client-socket (string-length "hello\r\n")))))
            (check result => "hello\r\n"))))

      (check-passed? 5))))
