;; http://srfi.schemers.org/srfi-42/srfi-42.html


(define-library (srfi 42)
  (export
   do-ec list-ec append-ec string-ec string-append-ec vector-ec
   vector-of-length-ec sum-ec product-ec min-ec max-ec any?-ec
   every?-ec first-ec last-ec fold-ec fold3-ec
   : :list :string :vector :integers
   :range :real-range :char-range :port
   :dispatched :do :let :parallel :while
   :until
   :-dispatch-ref :-dispatch-set!

; make-initial-:-dispatch
;   :-dispatch-ref
;   :-dispatch-set!
;   :generator-proc
;   dispatch-union :generator-proc
   )
  (import (scheme base)
          (scheme read)
          (scheme cxr)
          )
(include "srfi-42/ec.scm"))