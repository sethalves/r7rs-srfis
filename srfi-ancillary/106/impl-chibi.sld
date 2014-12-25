(define-library (srfi-ancillary 106 impl-chibi)
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
          (rename (srfi 8) (receive srfi-8-receive))
          (scheme write)
          (chibi filesystem)
          (chibi net)
          (srfi-ancillary 106 constants)
          )

  (begin

    (define-record-type <socket-and-ports>
      (make-socket-and-ports socket inport outport)
      socket-and-ports?
      (socket socket-and-ports-socket)
      (inport socket-and-ports-inport)
      (outport socket-and-ports-outport))


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
      (let ((sio (open-net-io node service)))
        (apply make-socket-and-ports sio)))


    (define (make-server-socket-impl service ai-family ai-socktype ai-protocol)
      (only-supported ai-family ai-socktype ai-protocol)
      (let ((addr-info (get-address-info
                        #f service
                        (make-address-info address-family/inet
                                           socket-type/stream
                                           ip-proto/tcp ;; ip-proto/ip
                                           ;; ai/passive
                                           )))
            )
        (make-listener-socket addr-info 5)))


    (define (socket? object)
      (error "socket? is unimplemented"))


    (define (socket-accept socket)
      (let* ((addrinfo (get-address-info "127.0.0.1" 0))
             (fd (accept socket
                         (address-info-address addrinfo)
                         (address-info-address-length addrinfo))))
        (make-socket-and-ports fd
                               (open-input-file-descriptor fd)
                               (open-output-file-descriptor fd))))


    (define (socket-send-imp socket bv flags)
      ;; (display "sending ") (write (bytevector-length bv)) (newline)
      ;; (send (socket-and-ports-socket socket) bv)
      (write-bytevector bv (socket-and-ports-outport socket))
      (flush-output-port (socket-and-ports-outport socket))
      )


    (define (socket-recv-impl socket size flags)
      ;; (display "receiving...\n")
      (receive (socket-and-ports-socket socket) size))


    (define (socket-shutdown socket how)
      (error "socket-shutdown is unimplemented"))


    (define (socket-close socket)
      (cond
       ((socket-and-ports? socket)
        (close-file-descriptor (socket-and-ports-socket socket)))
       (else
        (close-file-descriptor socket))))


    (define (socket-input-port socket)
      (socket-and-ports-inport socket))


    (define (socket-output-port socket)
      (socket-and-ports-outport socket))


    (define (call-with-socket socket proc)
      (srfi-8-receive args (proc socket)
                      (socket-close socket)
                      (apply values args)))

    ))
