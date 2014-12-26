(define-library (srfi-tests 18 tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (srfi-ancillary 18 faux)
          (srfi 78)
          )
  (begin
    (define (run-tests)

      (let ((thread (make-thread (lambda () 5))))
        (thread-start! thread)
        (check (thread-join! thread) => 5))


      (check (mutex-state (make-mutex))  =>  'not-abandoned)


      (let ((mutex (make-mutex)))
        (mutex-lock! mutex #f (current-thread))
        (let ((state (mutex-state mutex)))
          (mutex-unlock! mutex)
          (check (eq? state (current-thread)) => #t)))

      (let ((mutex (make-mutex)))
        (check (mutex-lock! mutex 0) => #t)
        (check (mutex-lock! mutex 0) => #f)
        (mutex-unlock! mutex))


      #t)))
