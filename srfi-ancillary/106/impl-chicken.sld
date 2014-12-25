(define-library (srfi-ancillary 106 impl-chicken)
  (export make-client-socket-impl
          make-server-socket-impl
          socket?
          socket-accept
          socket-send-imp
          socket-recv-impl
          socket-shutdown
          socket-close
          socket-input-port
          socket-output-port
          call-with-socket)

  (import (scheme base)
          (scheme read)
          (scheme write)
          (tcp)
          (srfi-ancillary 106 constants)
          )

  (begin

    (define-syntax receive
      (syntax-rules ()
        ((receive formals expression body ...)
         (call-with-values (lambda () expression)
           (lambda formals body ...)))))

    (tcp-read-timeout #f)
    (tcp-write-timeout #f)
    (tcp-accept-timeout #f)

    (define-record-type <socket-ports>
      (make-socket-ports inport outport)
      socket-ports?
      (inport socket-ports-inport)
      (outport socket-ports-outport))

    (define-record-type <listen-socket>
      (make-listen-socket socket)
      listen-socket?
      (socket listen-socket-socket))


    (define (service->port-no service)
      (cond ((number? service) service)
            ((string? service)
             (let ((v (string->number service)))
               (if v v
                   (error "write code to turn string to port-no" service))))))


    (define (only-supported ai-family ai-socktype ai-protocol)
      (if (not (eq? ai-family *af-inet*))
          (error "only ai-family *af-inet* is supported" ai-family))
      (if (not (eq? ai-socktype *sock-stream*))
          (error "only ai-socktype *sock-stream* is supported" ai-socktype))
      (if (not (eq? ai-protocol *ipproto-ip*))
          (error "only ai-protocol *ipproto-ip* is supported" ai-protocol)))


    (define (make-client-socket-impl node service ai-family ai-socktype
                                     ai-flags ai-protocol)
      (only-supported ai-family ai-socktype ai-protocol)
      (let-values (((read-port write-port)
                    (tcp-connect node (service->port-no service))))
        (make-socket-ports read-port write-port)))


    (define (make-server-socket-impl service ai-family ai-socktype ai-protocol)
      (only-supported ai-family ai-socktype ai-protocol)
      (make-listen-socket
       (tcp-listen (service->port-no service) 4 #f)))


    (define (socket? object)
      (or (socket-ports? object)
          (listen-socket? object)))


    (define (socket-accept listen-socket)
      (let-values (((in-port out-port)
                    (tcp-accept (listen-socket-socket listen-socket))))
        (make-socket-ports in-port out-port)))


    (define (socket-send-imp socket bv flags)
      (write-bytevector bv (socket-ports-outport socket))
      (flush-output-port (socket-ports-outport socket)))


    (define (socket-recv-impl socket size flags)
      (read-bytevector size (socket-ports-inport socket)))


    (define (socket-shutdown socket how)
      (close-output-port (socket-ports-outport socket)))


    (define (socket-close socket)
      (cond
       ((socket-ports? socket)
        (close-input-port (socket-ports-inport socket))
        (close-output-port (socket-ports-outport socket)))
       ((listen-socket? socket)
        (tcp-close (listen-socket-socket socket)))
       (else
        (error "socket-close called on non-socket" socket))))


    (define (socket-input-port socket)
      (socket-ports-inport socket))


    (define (socket-output-port socket)
      (socket-ports-outport socket))


    (define (call-with-socket socket proc)
      (receive args (proc socket)
               (socket-close socket)
               (apply values args)))

    ))
