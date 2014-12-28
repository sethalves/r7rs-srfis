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

    (define (alt-sleep! timeout)
      (let ((m (make-mutex)))
        (mutex-lock! m #f #f)
        (mutex-lock! m timeout #f)))


    (define (lock-one-of! mutex1 mutex2)
      ;; this procedure assumes that neither mutex1 or mutex2
      ;; are owned by the current thread
      (let ((ct (current-thread))
            (done-mutex (make-mutex)))
        (mutex-lock! done-mutex #f #f)
        (let ((t1 (thread-start!
                   (make-thread
                    (lambda ()
                      (mutex-lock! mutex1 #f ct)
                      (mutex-unlock! done-mutex)))))
              (t2 (thread-start!
                   (make-thread
                    (lambda ()
                      (mutex-lock! mutex2 #f ct)
                      (mutex-unlock! done-mutex))))))
          (mutex-lock! done-mutex #f #f)
          (thread-terminate! t1)
          (thread-terminate! t2)
          (if (eq? (mutex-state mutex1) ct)
              (begin
                (if (eq? (mutex-state mutex2) ct)
                    (mutex-unlock! mutex2)) ; don't lock both
                mutex1)
              mutex2))))




    ;; an implementation of a mailbox object of depth one; this
    ;; implementation behaves gracefully when threads are forcibly
    ;; terminated using thread-terminate! (the "abandoned mutex"
    ;; exception will be raised when a put! or get! operation is attempted
    ;; after a thread is terminated in the middle of a put! or get!
    ;; operation)

    (define (make-empty-mailbox)
      (let ((mutex (make-mutex "mailbox-mutex"))
            (put-condvar (make-condition-variable "put-condvar"))
            (get-condvar (make-condition-variable "get-condvar"))
            (full? #f)
            (cell #f))

        (define (put! obj)
          (mutex-lock! mutex)
          (if full?
              (begin
                (mutex-unlock! mutex put-condvar)
                (put! obj))
              (begin
                (set! cell obj)
                (set! full? #t)
                (condition-variable-signal! get-condvar)
                (mutex-unlock! mutex))))

        (define (get!)
          (mutex-lock! mutex)
          (if (not full?)
              (begin
                (mutex-unlock! mutex get-condvar)
                (get!))
              (let ((result cell))
                (set! cell #f) ; avoid space leaks
                (set! full? #f)
                (condition-variable-signal! put-condvar)
                (mutex-unlock! mutex)
                result)))

        (lambda (msg)
          (case msg
            ((put!) put!)
            ((get!) get!)
            (else (error "unknown message"))))))

    (define (mailbox-put! m obj) ((m 'put!) obj))
    (define (mailbox-get! m) ((m 'get!)))



    (define (make-semaphore n)
      (vector n (make-mutex) (make-condition-variable)))

    (define (semaphore-wait! sema)
      (mutex-lock! (vector-ref sema 1))
      (let ((n (vector-ref sema 0)))
        (if (> n 0)
            (begin
              (vector-set! sema 0 (- n 1))
              (mutex-unlock! (vector-ref sema 1)))
            (begin
              (mutex-unlock! (vector-ref sema 1) (vector-ref sema 2))
              (semaphore-wait! sema)))))

    (define (semaphore-signal-by! sema increment)
      (mutex-lock! (vector-ref sema 1))
      (let ((n (+ (vector-ref sema 0) increment)))
        (vector-set! sema 0 n)
        (if (> n 0)
            (condition-variable-broadcast! (vector-ref sema 2)))
        (mutex-unlock! (vector-ref sema 1))))


    (define (run-tests)

      (check-reset!)

      (check (eq? (current-thread) (current-thread)) => #t)
      (check (thread? (current-thread)) => #t)
      (check (thread? 'foo) => #f) 

      (check (thread-name (make-thread (lambda () #f) 'foo)) => 'foo)

      (let ((t (thread-start! (make-thread (lambda () #t)))))
        (thread-specific-set! t "hello")
        (check (thread-specific t) => "hello"))

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
        (thread-sleep! 1.1)
        (check (>= (current-second) (+ start-time 1.0)) => #t))


      (let ((start-time (current-second)))
        (alt-sleep! 1.1)
        (check (>= (current-second) (+ start-time 1.0)) => #t))

      (let ((thread (make-thread
                     (lambda ()
                       (for-each
                        (lambda (x)
                          (thread-sleep! 1)
                          (thread-yield!))
                        '(1 2 3 4))
                       5))))
        (thread-start! thread)
        (thread-terminate! thread)
        (check
         (guard
             (err (#t 'success))
           (thread-join! thread)
           #f)
         => 'success))


      (let* ((mutex1 (make-mutex))
             (mutex2 (make-mutex))
             (loo-thread (make-thread
                          (lambda ()
                            (lock-one-of! mutex1 mutex2)
                            (thread-yield!)
                            (thread-sleep! 1)))))
        (mutex-lock! mutex1)
        (thread-start! loo-thread)
        (thread-sleep! 1)
        (check (eq? (mutex-state mutex2) loo-thread) => #t))


      (check (condition-variable-name (make-condition-variable 'foo)) => 'foo)


      (let ((cv (make-condition-variable)))
        (condition-variable-specific-set! cv "hello")
        (check (condition-variable-specific cv) =>  "hello"))


      (let* ((mbox (make-empty-mailbox))
             (putter-thread (make-thread
                             (lambda ()
                               (mailbox-put! mbox 0)
                               (mailbox-put! mbox 1)
                               (mailbox-put! mbox 2)
                               (mailbox-put! mbox 15)
                               (mailbox-put! mbox 100)))))
        (thread-start! putter-thread)
        (check (mailbox-get! mbox) => 0)
        (check (mailbox-get! mbox) => 1)
        (check (mailbox-get! mbox) => 2)
        (check (mailbox-get! mbox) => 15)
        (check (mailbox-get! mbox) => 100))


      (let* ((s (make-semaphore 0))
             (s-thread (make-thread
                        (lambda ()
                          (semaphore-signal-by! s 1)
                          (semaphore-signal-by! s 2)
                          (semaphore-signal-by! s 1)))))
        (thread-start! s-thread)
        (semaphore-wait! s)
        (semaphore-wait! s)
        (semaphore-wait! s)
        (semaphore-wait! s))

      (check-passed? 21)
      )))
