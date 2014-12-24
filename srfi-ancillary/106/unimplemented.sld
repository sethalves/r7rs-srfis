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
          call-with-socket

          ;; Flag operations
          address-family
          address-info 
          socket-domain
          ip-protocol
          message-type
          shutdown-method
          socket-merge-flags
          socket-purge-flags    

          ;; Constant values
          *af-unspec* *af-inet* *af-inet6*
          *sock-stream* *sock-dgram*
          *ai-canonname* *ai-numerichost*
          *ai-v4mapped* *ai-all* *ai-addrconfig*
          *ipproto-ip* *ipproto-tcp* *ipproto-udp*
          *msg-peek* *msg-oob* *msg-waitall*
          *shut-rd* *shut-wr* *shut-rdwr*)

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
