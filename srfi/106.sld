;;
;;
;; http://srfi.schemers.org/srfi-106/srfi-106.html
;;
;;


;; in make-server-socket argument is service, not node.  also,
;; shouldn't there be a way to specify local listen address?

;; in address-info canoname rather than canonname

;; in the echo server example, server-run is missing a right-paren


(define-library (srfi 106)
  (export

   ;; Constructors and predicate
   make-client-socket
   make-server-socket
   socket?

   ;; Socket operations
   socket-accept
   socket-send
   socket-recv
   socket-shutdown
   socket-close

   ;; Port conversion
   socket-input-port
   socket-output-port

   ;; Control feature
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
   *shut-rd* *shut-wr* *shut-rdwr*
   )

  (import (scheme base)
          (scheme write)
          (scheme case-lambda)
          (only (srfi 1) lset-adjoin lset-difference)
          (srfi-ancillary 106 constants)
          (srfi-ancillary 106 interface)
          ))
