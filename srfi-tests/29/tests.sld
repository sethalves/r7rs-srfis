(define-library (srfi-tests 29 tests)
  (export run-tests)
  (import (scheme base)
          (srfi 29))
  (begin
    (define (run-tests)
      (and

       (equal? (format "Hello, ~a" "World!") "Hello, World!")

       (equal?
        (format "Error, list is too short: ~s" '(one "two" 3))
        "Error, list is too short: (one \"two\" 3)")

       (equal? (format "test me") "test me")

       ;; (equal?
       ;;  (with-output-to-string
       ;;    (lambda ()
       ;;      (format #t "test me")))
       ;;  "test me")

       (equal? (format "~a ~s ~a ~s" 'this 'is "a" "test")
               "this is a \"test\"")

       ))))
