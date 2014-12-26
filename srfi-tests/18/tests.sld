(define-library (srfi-tests 18 tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (scheme time)
          ;; (srfi-ancillary 18 faux)
          (srfi 18)
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


      (let ((start-time (current-second)))
        (thread-sleep! 1.5)
        (check (> (current-second) (+ start-time 1.0)) => #t))


      (let ((thread (make-thread
                     (lambda ()
                       (for-each
                        (lambda (x)
                          (thread-sleep! 1)
                          (thread-yield!))
                        '(1 2 3 4 5 6 7 8 9 10))
                       5))))
        (thread-start! thread)
        (thread-terminate! thread)
        (check
         (guard
             (err (#t 'success))
           (thread-join! thread)
           #f)
         => 'success))


      (check-passed? 7))))
