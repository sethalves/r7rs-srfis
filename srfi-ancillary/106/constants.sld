(define-library (srfi-ancillary 106 constants)
  (export
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

   ;; socket-flag->symbol
   )

  (import (scheme base)
          (scheme write)
          (only (srfi 1) lset-adjoin lset-difference)
          )

  (begin

    ;;
    ;; typed constant values
    ;;

    (define-record-type <address-family> (make-address-family) address-family?)
    ;; Internet domain sockets for use with IPv4 addresses.
    ;; This must behave the same as POSIX's AF_INET. 
    (define *af-inet* (make-address-family))
    ;; Internet domain sockets for use with IPv6 addresses.
    ;; This must behave the same as POSIX's AF_INET6. 
    (define *af-inet6* (make-address-family))
    ;; Unspecified.
    ;; This must behave the same as POSIX's AF_UNSPEC. 
    (define *af-unspec* (make-address-family))


    (define-record-type <socket-domain> (make-socket-domain) socket-domain?)
    ;; Byte-stream socket.
    ;; This must behave the same as POSIX's SOCK_STREAM. 
    (define *sock-stream* (make-socket-domain))
    ;; Datagram socket.
    ;; This must behave the same as POSIX's SOCK_DGRAM. 
    (define *sock-dgram* (make-socket-domain))


    (define-record-type <address-info> (make-address-info) address-info?)
    ;; This must behave the same as POSIX's AI_CANONNAME. 
    (define *ai-canonname* (make-address-info))
    ;; This must behave the same as POSIX's AI_NUMERICHOST. 
    (define *ai-numerichost* (make-address-info))
    ;; This must behave the same as POSIX's AI_V4MAPPED. 
    (define *ai-v4mapped* (make-address-info))
    ;; This must behave the same as POSIX's AI_ALL. 
    (define *ai-all* (make-address-info))
    ;; This must behave the same as POSIX's AI_ADDRCONFIG. 
    (define *ai-addrconfig* (make-address-info))


    (define-record-type <ip-protocol> (make-ip-protocol) ip-protocol?)
    ;; Internet protocol.
    ;; This must behave the same as POSIX's IPPROTO_IP. 
    (define *ipproto-ip* (make-ip-protocol))
    ;; Transmission control protocol.
    ;; This must behave the same as POSIX's IPPROTO_TCP. 
    (define *ipproto-tcp* (make-ip-protocol))
    ;; User datagram protocol.
    ;; This must behave the same as POSIX's IPPROTO_UDP. 
    (define *ipproto-udp* (make-ip-protocol))


    (define-record-type <message-type> (make-message-type) message-type?)
    ;; For socket-recv.
    ;; Peeks at an incoming message. The data is treated as unread and the
    ;; next socket-recv shall still return this data.
    ;; This must behave the same as POSIX's MSG_PEEK. 
    (define *msg-peek* (make-message-type))
    ;; For both socket-recv and socket-send.
    ;; Requests/sends out-of-band data.
    ;; This must behave the same as POSIX's MSG_OOB. 
    (define *msg-oob* (make-message-type))
    ;; For socket-recv.
    ;; On sockets created with *sock-stream* flag, this requests the procedure
    ;; block until the full amount of data ban be returned.
    ;; This must behave the same as POSIX's MSG_WAITALL. 
    (define *msg-waitall* (make-message-type))


    (define-record-type <shutdown-method>
      (make-shutdown-method) shutdown-method?)
    ;; Disables further receive operation.
    ;; This must behave the same as POSIX's SHUT_RD. 
    (define *shut-rd* (make-shutdown-method))
    ;; Disables further send operations.
    ;; This must behave the same as POSIX's SHUT_WR. 
    (define *shut-wr* (make-shutdown-method))
    ;; Disables further send and receive operations.
    ;; This must behave the same as POSIX's SHUT_RDWR. 
    (define *shut-rdwr* (make-shutdown-method))

    (define-syntax address-family
      (syntax-rules (inet inet6 unspec)
        ((_ inet) *af-inet*)
        ((_ inet6) *af-inet6*)
        ((_ unspec) *af-unspec*)
        ;; unix
        ;; local
        ((_ name names ...)
         (socket-merge-flags
          (address-family name)
          (address-family names ...)))
        ))

    (define-syntax address-info
      (syntax-rules (canonname numerichost v4mapped all addrconfig)
        ((_ canonname) *ai-canonname*)
        ((_ numerichost) *ai-numerichost*)
        ((_ v4mapped) *ai-v4mapped*)
        ((_ all) *ai-all*)
        ((_ addrconfig) *ai-addrconfig*)
        ((_ name names ...)
         (socket-merge-flags
          (address-info name)
          (address-info names ...)))))


    (define-syntax socket-domain
      (syntax-rules (stream datagram)
        ((_ stream) *sock-stream*)
        ((_ datagram) *sock-dgram*)
        ((_ name names ...)
         (socket-merge-flags
          (socket-domain name)
          (socket-domain names ...)))))


    (define-syntax ip-protocol
      (syntax-rules (ip tcp udp)
        ((_ ip) *ipproto-ip*)
        ((_ tcp) *ipproto-tcp*)
        ((_ udp) *ipproto-udp*)
        ((_ name names ...)
         (socket-merge-flags
          (ip-protocol name)
          (ip-protocol names ...)))))


    (define-syntax message-type
      (syntax-rules (none peek oob wait-all)
        ((_ none) #f)
        ((_ peek) *msg-peek*)
        ((_ oob) *msg-oob*)
        ((_ wait-all) *msg-waitall*)
        ((_ name names ...)
         (socket-merge-flags
          (message-type name)
          (message-type names ...)))))


    (define-syntax shutdown-method
      (syntax-rules (read write)
        ((_ read) *shut-rd*)
        ((_ write) *shut-wr*)
        ((_ name names ...)
         (socket-merge-flags
          (shutdown-method name)
          (shutdown-method names ...)))))


    (define (socket-merge-flags . flags)
      (let loop ((flags flags)
                 (result '()))
        (cond ((null? flags) result)
              ((list? (car flags))
               (loop (append (car flags) (cdr flags))
                     result))
              (else
               (loop (cdr flags)
                     (lset-adjoin eq? result (car flags)))))))


    (define (socket-purge-flags base-flags . flags)
      (let loop ((flags flags)
                 (result (socket-merge-flags base-flags)))
        (cond ((null? flags) result)
              ((list? (car flags))
               (loop (append (car flags) (cdr flags))
                     result))
              (else
               (loop (cdr flags)
                     (lset-difference eq? result (list (car flags))))))))
    ))
