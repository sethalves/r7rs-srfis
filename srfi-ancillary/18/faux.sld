(define-library (srfi-ancillary 18 faux)
  (export current-thread
          thread?
          make-thread
          thread-name
          thread-specific
          thread-specific-set!
          thread-start!
          thread-yield!
          thread-sleep!
          thread-terminate!
          thread-join!
          mutex?
          make-mutex
          mutex-name
          mutex-specific
          mutex-specific-set!
          mutex-state
          mutex-lock!
          mutex-unlock!
          condition-variable?
          make-condition-variable
          condition-variable-name
          condition-variable-specific
          condition-variable-specific-set!
          condition-variable-signal!
          condition-variable-broadcast!
          current-time
          time?
          time->seconds
          seconds->time
          current-exception-handler
          join-timeout-exception?
          abandoned-mutex-exception?
          terminated-thread-exception?
          uncaught-exception?
          uncaught-exception-reason)

  (import (scheme base)
          (scheme case-lambda)
          (scheme time)
          (scheme write)
          )

  (begin


    (define-record-type <time>
      (seconds->time seconds) ;; since epoch
      time?
      (seconds time->seconds))

    (define (current-time)
      (seconds->time (current-second)))

    (define (past-time? tm)
      (cond ((eq? tm #f) #f)
            ((time? tm)
             (>= (current-second) (time->seconds tm)))
            ((number? tm)
             (= tm 0))
            (else
             (error "invalid time object" tm))))

    (define (->time tm)
      (cond ((eq? tm #f) #f)
            ((time? tm) tm)
            ((number? tm) (seconds->time (+ (current-second) tm)))
            (else (error "invalid time object" tm))))



    (define-record-type <srfi-18-exception>
      (new-exception type reason)
      srfi-18-exception?
      (type srfi-18-exception-type)
      (reason srfi-18-exception-reason))



    (define-record-type <thread>
      (new-thread thunk next previous state name specific
                  end-result end-exception mutexes sleep-until
                  join-thread wait-on-mutex)
      thread?
      (thunk thread-thunk thread-thunk-set!)
      (next thread-next thread-next-set!)
      (previous thread-previous thread-previous-set!)
      (state thread-state thread-state-set!)
      (name thread-name)
      (specific thread-specific thread-specific-set!)
      (end-result thread-end-result thread-end-result-set!)
      (end-exception thread-end-exception thread-end-exception-set!)
      (mutexes thread-mutexes thread-mutexes-set!)
      (sleep-until thread-sleep-until thread-sleep-until-set!)
      (join-thread thread-join-thread thread-join-thread-set!)
      (wait-on-mutex thread-wait-on-mutex thread-wait-on-mutex-set!)
      )


    (define-record-type <mutex>
      (new-mutex locked? owner name specific)
      mutex?
      (locked? mutex-locked? mutex-locked?-set!)
      (owner mutex-owner mutex-owner-set!)
      (name mutex-name)
      (specific mutex-specific mutex-specific-set!))


    (define-record-type <condition-variable>
      (new-condition-variable name blocked-threads specific)
      condition-variable?
      (name condition-variable-name)
      (blocked-threads condition-variable-blocked-threads
                       condition-variable-blocked-threads-set!)
      (specific condition-variable-specific condition-variable-specific-set!))


    (define running-thread (new-thread
                            #f ;; thunk
                            #f ;; next
                            #f ;; previous
                            'runnable
                            "primordial"
                            #f ;; specific
                            #f ;; end-result
                            #f ;; end-exception
                            '() ;; mutexes
                            #f ;; sleep until
                            #f ;; join thread
                            #f ;; waiting to lock mutex
                            ))
    (thread-next-set! running-thread running-thread)
    (thread-previous-set! running-thread running-thread)


    ;; (define (trace->writable x)
    ;;   (cond ((boolean? x) x)
    ;;         ((thread? x) (thread-name x))
    ;;         ((mutex? x) (mutex-name x))
    ;;         ((condition-variable? x) (condition-variable-name x))
    ;;         (else x)))


    ;; (define-syntax trace
    ;;   (syntax-rules ()
    ;;     ((_ what) (begin
    ;;                 (write (cons (trace->writable running-thread)
    ;;                              (cons ":"
    ;;                                    (map trace->writable what))))
    ;;                 (newline)))))

    (define-syntax trace
      (syntax-rules ()
        ((_ what) #t)))


    (define (current-thread)
      (trace `(current-thread))
      running-thread)

    (define (thread-ends thread end-result)
      (thread-state-set! thread 'terminated)
      (thread-end-result-set! thread end-result)
      (scheduler))

    (define make-thread
      (case-lambda
       ((thunk) (make-thread thunk "unknown"))
       ((thunk name)
        (trace `(make-thread thunk ,name))
        (let* ((was-prev-thread (thread-previous running-thread))
               (new-t (new-thread
                       #f
                       running-thread
                       was-prev-thread
                       'new
                       name
                       #f ;; specific
                       #f ;; end-result
                       #f ;; end-exception
                       '() ;; mutexes
                       #f ;; sleep until
                       #f ;; join thread
                       #f ;; waiting to lock mutex
                       )))
          (thread-thunk-set! new-t
                             (lambda ()
                               (thread-ends new-t (thunk))))
          (thread-previous-set! running-thread new-t)
          (thread-next-set! was-prev-thread new-t)
          new-t))))


    (define (thread-start! thread)
      (trace `(thread-start! ,thread))
      (if (not (eq? (thread-state thread) 'new))
          (error "thread-start! called on non-new thread" thread))
      (thread-state-set! thread 'runnable)
      thread)


    ;; (define (display-thread thread)
    ;;   ;; (write thread)
    ;;   (display " state=")
    ;;   (write (thread-state thread))
    ;;   (display " name=")
    ;;   (write (thread-name thread))
    ;;   (display " join=")
    ;;   (write (thread-join-thread thread))
    ;;   (display " sleep=")
    ;;   (write (thread-sleep-until thread))
    ;;   (display " result=")
    ;;   (write (thread-end-result thread))
    ;;   (display " exn=")
    ;;   (write (thread-end-exception thread))
    ;;   (newline))


    ;; (define (display-threads label)
    ;;   (display "--------------------------\n")
    ;;   (display label)
    ;;   (newline)
    ;;   (display "--------------------------\n")
    ;;   (display-thread running-thread)
    ;;   (let loop ((thread (thread-next running-thread)))
    ;;     (cond ((eq? thread running-thread) #t)
    ;;           (else
    ;;            (display-thread thread)
    ;;            (loop (thread-next thread)))))
    ;;   (newline))


    (define (make-thread-runnable thread)
      (thread-join-thread-set! thread #f)
      (thread-sleep-until-set! thread #f)
      (thread-wait-on-mutex-set! thread #f)
      (thread-state-set! thread 'runnable)
      thread)


    (define (scheduler)
      (let ((thread-to-run
             (let loop ((thread (thread-next running-thread)))
               ;; (display-threads "scheduler")

               (cond
                ;; not blocked
                ((eq? (thread-state thread) 'runnable)
                 thread)

                ;; waiting to join another thread
                ((and (eq? (thread-state thread) 'blocked)
                      (thread-join-thread thread)
                      (eq? (thread-state (thread-join-thread thread))
                           'terminated))
                 (make-thread-runnable thread))

                ;; sleeping
                ((and (eq? (thread-state thread) 'blocked)
                      (thread-sleep-until thread)
                      (past-time? (thread-sleep-until thread)))
                 (make-thread-runnable thread))

                ;; blocked when trying to lock a mutex
                ((and (eq? (thread-state thread) 'blocked)
                      (thread-wait-on-mutex thread)
                      (not (mutex-locked? (thread-wait-on-mutex thread))))
                 (make-thread-runnable thread))

                (else
                 (loop (thread-next thread)))))))
        (trace `(SCHEDULER ,thread-to-run))
        (set! running-thread thread-to-run)
        (let ((thunk-to-run (thread-thunk running-thread)))
          (thread-thunk-set! running-thread #f)
          (thunk-to-run))))


    (define (thread-yield!) 
      (trace `(thread-yield!))
      (call-with-current-continuation
       (lambda (cont)
         (thread-thunk-set! running-thread (lambda () (cont #t)))
         (scheduler))))


    (define (thread-sleep! timeout)
      (trace `(thread-sleep! ,timeout))
      (cond ((not (past-time? timeout))
             (thread-sleep-until-set! running-thread (->time timeout))
             (thread-state-set! running-thread 'blocked)
             (thread-yield!))))


    (define (thread-terminate! thread)
      (trace `(thread-terminate! ,thread))
      ;; Causes an abnormal termination of the thread.
      (cond ((not (eq? (thread-state thread) 'terminated))
             ;; If the thread is not already terminated
             (thread-state-set! running-thread 'terminated)
             ;; all mutexes owned by the thread become unlocked/abandoned
             (for-each
              (lambda (mutex)
                (mutex-owner-set! mutex #f)
                (mutex-locked?-set! mutex #f))
              (thread-mutexes thread))
             ;; a "terminated thread exception" object is stored in
             ;; the thread's end-exception field.
             (thread-end-exception-set!
              thread (new-exception 'terminated-thread #f))
             ;; If thread is the current thread, do not return.
             (if (eq? thread running-thread)
                 (scheduler)
                 #f))
            (else #f)))


    (define thread-join!
      (case-lambda
       ((thread) (thread-join! thread #f))
       ((thread timeout)
        (thread-join! thread timeout (new-exception 'join-timeout #f)))
       ((thread timeout timeout-value)
        (trace `(thread-join! ,thread ,timeout ,timeout-value))
        (cond
         ((past-time? timeout)
          ;; if timeout was 0, return immediately
          (if (eq? (thread-state thread) 'terminated)
              (or (thread-end-exception thread)
                  (thread-end-result thread))
              timeout-value))
         (else
          ;; block running thread
          (thread-sleep-until-set! running-thread (->time timeout))
          (thread-join-thread-set! running-thread thread)
          (thread-state-set! running-thread 'blocked)
          ;; pass control to scheduler             
          (let ((result
                 (call-with-current-continuation
                  (lambda (cont)
                    (thread-thunk-set!
                     running-thread
                     (lambda ()
                       ;; scheduler activated this thread, so either the
                       ;; thread we're joining terminated or we timed out
                       (cont (if (eq? (thread-state thread) 'terminated)
                                 ;; thread terminated.
                                 (or (thread-end-exception thread)
                                     (thread-end-result thread))
                                 ;; timeout reached
                                 timeout-value))))
                    (scheduler)))))
            (if (srfi-18-exception? result)
                (raise result)
                result)))))))


    (define make-mutex
      (case-lambda
       (() (make-mutex #f))
       ((name)
        (trace `(make-mutex ,name))
        (let ((m (new-mutex #f running-thread name #f)))
          (thread-mutexes-set!
           running-thread
           (cons m (thread-mutexes running-thread)))
          m))))


    (define (mutex-state mutex)
      (cond ((and (mutex-locked? mutex) (mutex-owner mutex))
             (mutex-owner mutex))
            ((and (mutex-locked? mutex) (not (mutex-owner mutex)))
             'not-owned)
            ((and (not (mutex-locked? mutex)) (not (mutex-owner mutex)))
             'abandoned)
            ((and (not (mutex-locked? mutex)) (mutex-owner mutex))
             'not-abandoned)))


    (define mutex-lock!
      (case-lambda
       ((mutex) (mutex-lock! mutex #f running-thread))
       ((mutex timeout) (mutex-lock! mutex timeout running-thread))
       ((mutex timeout thread)
        (trace `(mutex-lock! ,mutex ,timeout ,thread))
        (cond ((and (mutex-locked? mutex) (not (past-time? timeout)))
               (let ((timeout (->time timeout)))
                 (call-with-current-continuation
                  (lambda (cont)
                    (thread-state-set! running-thread 'blocked)
                    (thread-wait-on-mutex-set! running-thread mutex)
                    (thread-sleep-until-set! running-thread timeout)
                    (thread-thunk-set!
                     running-thread
                     (lambda ()
                       (cont (mutex-lock! mutex timeout thread))))
                    (scheduler)))))

              ((mutex-locked? mutex)
               ;; timeout is 0
               #f)

              ;; mutex wasn't locked...
              ((not thread)
               ;; if thread is #f the mutex becomes locked/not-owned
               (mutex-owner-set! mutex #f)
               (mutex-locked?-set! mutex #t)
               #t)

              ((eq? (thread-state thread) 'terminated)
               ;; if thread is terminated the mutex becomes unlocked/abandoned
               (mutex-owner-set! mutex #f)
               (mutex-locked?-set! mutex #f)
               #f)

              (else
               ;; otherwise mutex becomes locked/owned with thread
               ;; as the owner. 
               (mutex-owner-set! mutex thread)
               (mutex-locked?-set! mutex #t)
               #t)))))


    (define mutex-unlock!
      (case-lambda
       ((mutex)
        (trace `(mutex-unlock! ,mutex))
        (mutex-locked?-set! mutex #f))
       ((mutex condition-variable)
        (mutex-unlock! mutex condition-variable #f))
       ((mutex condition-variable timeout)
        (trace `(mutex-unlock! ,mutex ,condition-variable ,timeout))
        (condition-variable-blocked-threads-set!
         condition-variable
         (cons running-thread
               (condition-variable-blocked-threads condition-variable)))

        (thread-sleep-until-set! running-thread (->time timeout))
        (thread-state-set! running-thread 'blocked)
        (mutex-locked?-set! mutex #f)

        (call-with-current-continuation
         (lambda (cont)
           (thread-thunk-set!
            running-thread
            (lambda ()
              (cont (not (past-time? timeout)))))
           (scheduler))))))



    (define make-condition-variable
      (case-lambda
       (() (make-condition-variable #f))
       ((name)
        (trace `(make-condition-variable ,name))
        (new-condition-variable name '() #f))))


    (define (condition-variable-signal! condition-variable)
      (trace `(condition-variable-signal! ,condition-variable))
      (let ((blocked-threads
             (condition-variable-blocked-threads condition-variable)))
        (cond ((null? blocked-threads) #t)
              (else
               (condition-variable-blocked-threads-set!
                condition-variable (cdr blocked-threads))
               (thread-state-set! (car blocked-threads) 'runnable)))))


    (define (condition-variable-broadcast! condition-variable)
      (trace `(condition-variable-broadcast! ,condition-variable))
      (for-each
       (lambda (thread)
         (thread-state-set! thread 'runnable))
       (condition-variable-blocked-threads condition-variable))
      (condition-variable-blocked-threads-set! condition-variable '()))


    (define (current-exception-handler)
      (error "current-exception-handler is unimplemented"))


    (define (join-timeout-exception? obj)
      (and (srfi-18-exception? obj)
           (eq? srfi-18-exception-type 'join-timeout)))

    (define (abandoned-mutex-exception? obj)
      (and (srfi-18-exception? obj)
           (eq? srfi-18-exception-type 'abandoned-mutex)))

    (define (terminated-thread-exception? obj)
      (and (srfi-18-exception? obj)
           (eq? srfi-18-exception-type 'terminated-thread)))

    (define (uncaught-exception? obj)
      (and (srfi-18-exception? obj)
           (eq? srfi-18-exception-type 'uncaught)))

    (define (uncaught-exception-reason exc)
      (and (srfi-18-exception? exc)
           (srfi-18-exception-reason exc)))

    ))
