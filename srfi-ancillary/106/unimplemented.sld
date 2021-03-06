(define-library (srfi-ancillary 106 unimplemented)
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
          (srfi-ancillary 106 constants))

  (begin

    (define (make-client-socket-impl node service ai-family ai-socktype
                                     ai-flags ai-protocol)
      (error "make-client-socket is unimplemented"))


    (define (make-server-socket-impl
             service ai-family ai-socktype ai-protocol)
      (error "make-server-socket is unimplemented"))


    (define (socket? object)
      (error "socket? is unimplemented"))


    (define (socket-accept socket)
      (error "socket-accept is unimplemented"))


    (define (socket-send-imp socket bv flags)
      (error "socket-send-imp is unimplemented"))


    (define (socket-recv-impl socket size flags)
      (error "socket-recv-impl is unimplemented"))


    (define (socket-shutdown socket how)
      (error "socket-shutdown is unimplemented"))


    (define (socket-close socket)
      (error "socket-close is unimplemented"))


    (define (socket-input-port socket)
      (error "socket-input-port is unimplemented"))


    (define (socket-output-port socket)
      (error "socket-output-port is unimplemented"))


    (define (call-with-socket socket proc)
      (error "call-with-socket is unimplemented"))

    ))
