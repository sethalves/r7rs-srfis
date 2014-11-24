(define-library (srfi-tests 26 tests)
  (export run-tests)
  (import (scheme base)
          (srfi 26))
  (begin
    (define (run-tests)
      (equal? ((cut cons 2 <>) 5) (cons 2 5)))))
