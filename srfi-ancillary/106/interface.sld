(define-library (srfi-ancillary 106 interface)
  (export make-client-socket
          make-server-socket
          socket-send
          socket-recv

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
          *shut-rd* *shut-wr* *shut-rdwr*

          socket?
          socket-accept
          socket-shutdown
          socket-close
          socket-input-port
          socket-output-port
          call-with-socket

          )
  (import (scheme base)
          (scheme case-lambda))

  (cond-expand
   (chibi
    (import (srfi-ancillary 106 impl-chibi)))
   (chicken
    (import (srfi-ancillary 106 impl-chicken)))
   (else
    (import (srfi-ancillary 106 unimplemented))))

  (begin
    ;;
    ;; handle variable argument-list lengths
    ;;

    (define make-client-socket
      (case-lambda
       ((node service)
        (make-client-socket-impl
         node service *af-inet* *sock-stream*
         (socket-merge-flags *ai-v4mapped* *ai-addrconfig*) *ipproto-ip*))
       ((node service ai-family)
        (make-client-socket-impl
         node service ai-family *sock-stream*
         (socket-merge-flags *ai-v4mapped* *ai-addrconfig*) *ipproto-ip*))
       ((node service ai-family ai-socktype)
        (make-client-socket-impl
         node service ai-family ai-socktype
         (socket-merge-flags *ai-v4mapped* *ai-addrconfig*) *ipproto-ip*))
       ((node service ai-family ai-socktype ai-flags)
        (make-client-socket-impl
         node service ai-family ai-socktype ai-flags *ipproto-ip*))
       ((node service ai-family ai-socktype ai-flags ai-protocol)
        (make-client-socket-impl
         node service ai-family ai-socktype ai-flags ai-protocol))))


    (define make-server-socket
      (case-lambda
       ((service)
        (make-server-socket-impl
         service *af-inet* *sock-stream* *ipproto-ip*))
       ((service ai-family)
        (make-server-socket-impl
         service ai-family *sock-stream* *ipproto-ip*))
       ((service ai-family ai-socktype)
        (make-server-socket-impl
         service ai-family ai-socktype *ipproto-ip*))
       ((service ai-family ai-socktype ai-protocol)
        (make-server-socket-impl
         service ai-family ai-socktype ai-protocol))))


    (define socket-send
      (case-lambda
       ((socket bv)
        (socket-send-imp socket bv (message-type none)))
       ((socket bv flags)
        (socket-send-imp socket bv flags))))


    (define socket-recv
      (case-lambda
       ((socket size)
        (socket-recv-impl socket size (message-type none)))
       ((socket size flags)
        (socket-recv-impl socket size flags))))

    ))
