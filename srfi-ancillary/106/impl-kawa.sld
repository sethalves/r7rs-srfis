(define-library (srfi-ancillary 106 impl-kawa)
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
          (srfi 8)
          (srfi-ancillary 106 constants))

  (begin

    ;; http://docs.oracle.com/javase/6/docs/api/java/net/InetAddress.html
    ;; http://www.tutorialspoint.com/java/java_networking.htm

    (define-record-type <socket-and-ports>
      (make-socket-and-ports socket inport outport)
      socket-and-ports?
      (socket socket-and-ports-socket)
      (inport socket-and-ports-inport)
      (outport socket-and-ports-outport))


    (define (socket->path sock :: java.net.Socket) :: gnu.kawa.io.URIPath
      (let* ((uri :: java.net.URI
                  (java.net.URI
                   (string-append
                    "tcp://" ((sock:getRemoteSocketAddress):toString) ":"
                    (number->string (sock:getPort)) "/"))))
        (gnu.kawa.io.URIPath uri)))


    (define (only-supported ai-family ai-socktype ai-protocol)
      (if (not (eq? ai-family *af-inet*))
          (error "only ai-family *af-inet* is supported" ai-family))
      (if (not (eq? ai-socktype *sock-stream*))
          (error "only ai-socktype *sock-stream* is supported" ai-socktype))
      (if (not (eq? ai-protocol *ipproto-ip*))
          (error "only ai-protocol *ipproto-ip* is supported" ai-protocol)))


    (define (service->port-no service)
      (cond ((number? service) service)
            ((string? service)
             (let ((v (string->number service)))
               (if v v
                   (error "write code to turn string to port-no" service))))))


    (define (make-client-socket-impl node service ai-family ai-socktype
                                     ai-flags ai-protocol)
      (only-supported ai-family ai-socktype ai-protocol)
      (let* ((address :: java.net.InetAddress
                      (if node
                          (java.net.InetAddress:getByName node)
                          (java.net.InetAddress:getLocalHost)))
             (port :: int (service->port-no service))
             (sock :: java.net.Socket (java.net.Socket address port))
             (path :: gnu.kawa.io.URIPath (socket->path sock)))
        (make-socket-and-ports
         sock
         (gnu.kawa.io.BinaryInPort (sock:getInputStream))
         (gnu.kawa.io.BinaryOutPort (sock:getOutputStream) path))))


    (define (make-server-socket-impl service ai-family ai-socktype ai-protocol)
      (only-supported ai-family ai-socktype ai-protocol)
      (let ((server-socket :: java.net.ServerSocket
             (java.net.ServerSocket (string->number service))))
        server-socket))


    (define (socket? object)
      (socket-and-ports? object))


    (define (socket-accept java-listen-socket :: java.net.ServerSocket)
      (let* ((sock :: java.net.Socket (java-listen-socket:accept))
             (path :: gnu.kawa.io.URIPath (socket->path sock)))
        (make-socket-and-ports
         sock
         (gnu.kawa.io.BinaryInPort (sock:getInputStream))
         (gnu.kawa.io.BinaryOutPort (sock:getOutputStream) path))))


    (define (socket-send-imp socket bv flags)
      (write-bytevector bv (socket-and-ports-outport socket))
      (flush-output-port (socket-and-ports-outport socket)))


    (define (socket-recv-impl socket size flags)
      (read-bytevector size (socket-and-ports-inport socket)))


    (define (socket-shutdown socket how)
      (let ((java-sock :: java.net.Socket
                       (socket-and-ports-socket socket)))
        (java-sock:shutdownOutput)))


    (define (socket-close socket)
      (cond ((socket-and-ports? socket)
             (let ((java-sock :: java.net.Socket
                              (socket-and-ports-socket socket)))
               (java-sock:close)))
            (else
             (let ((java-listen-sock :: java.net.ServerSocket socket))
               (java-listen-sock:close)))))


    (define (socket-input-port socket)
      (socket-and-ports-inport socket))


    (define (socket-output-port socket)
      (socket-and-ports-outport socket))


    (define (call-with-socket socket proc)
      (receive args (proc socket)
               (socket-close socket)
               (apply values args)))

    ))
