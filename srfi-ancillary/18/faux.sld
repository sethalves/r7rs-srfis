(define-library (srfi-ancillary 18 faux)
  (export current-thread
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
          ;; with-exception-handler
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
                  join-thread)
      thread?
      (thunk thread-thunk thread-thunk-set!)
      (next thread-next thread-next-set!)
      (previous thread-previous thread-previous-set!)
      (state thread-state thread-state-set!)
      (name thread-name thread-name-set!)
      (specific thread-specific thread-specific-set!)
      (end-result thread-end-result thread-end-result-set!)
      (end-exception thread-end-exception thread-end-exception-set!)
      (mutexes thread-mutexes thread-mutexes-set!)
      (sleep-until thread-sleep-until thread-sleep-until-set!)
      (join-thread thread-join-thread thread-join-thread-set!)
      )


    (define-record-type <mutex>
      (new-mutex locked? owner name specific)
      mutex?
      (locked? mutex-locked? mutex-locked?-set!)
      (owner mutex-owner mutex-owner-set!)
      (name mutex-name)
      (specific mutex-specific mutex-specific-set!))


    (define-record-type <condition>
      (new-condition blocked-threads specific)
      condition?
      (blocked-threads condition-blocked-threads condition-blocked-thread-set!)
      (specific condition-specific condition-specific-set!))


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
                            ))
    (thread-next-set! running-thread running-thread)
    (thread-previous-set! running-thread running-thread)

    (define (current-thread) running-thread)

    (define (thread-ends thread end-result)
      ;; (write thread)
      ;; (display " is ending with ")
      ;; (write end-result)
      ;; (newline)

      (thread-state-set! thread 'terminated)
      (thread-end-result-set! thread end-result)
      (scheduler))

    (define make-thread
      (case-lambda
       ((thunk) (make-thread thunk "unknown"))
       ((thunk name)
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
                       )))
          (thread-thunk-set! new-t
                             (lambda ()
                               (thread-ends new-t (thunk))))
          (thread-previous-set! running-thread new-t)
          (thread-next-set! was-prev-thread new-t)
          new-t))))


    (define (thread-start! thread)
      (if (not (eq? (thread-state thread) 'new))
          (error "thread-start! called on non-new thread" thread))
      (thread-state-set! thread 'runnable)
      thread)


    (define (display-thread thread)
      ;; (write thread)
      (display " state=")
      (write (thread-state thread))
      (display " name=")
      (write (thread-name thread))
      (display " join=")
      (write (thread-join-thread thread))
      (display " sleep=")
      (write (thread-sleep-until thread))
      (display " result=")
      (write (thread-end-result thread))
      (display " exn=")
      (write (thread-end-exception thread))
      (newline))


    (define (display-threads label)
      (display "--------------------------\n")
      (display label)
      (newline)
      (display "--------------------------\n")
      (display-thread running-thread)
      (let loop ((thread (thread-next running-thread)))
        (cond ((eq? thread running-thread) #t)
              (else
               (display-thread thread)
               (loop (thread-next thread)))))
      (newline))


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
                 (thread-join-thread-set! thread #f)
                 (thread-state-set! thread 'runnable)
                 thread)

                ;; sleeping
                ((and (eq? (thread-state thread) 'blocked)
                      (thread-sleep-until thread)
                      (past-time? (thread-sleep-until thread)))
                 (thread-sleep-until-set! thread #f)
                 (thread-state-set! thread 'runnable)
                 thread)

                (else
                 (loop (thread-next thread)))))))
        (set! running-thread thread-to-run)
        ((thread-thunk running-thread))))


    (define (thread-yield!) 
      (call-with-current-continuation
       (lambda (cont)
         (thread-thunk-set!
          running-thread
          (lambda () (cont #t)))
         (scheduler))))


    (define (thread-sleep! timeout)
      (cond ((not (past-time? timeout))
             (thread-sleep-until-set! running-thread (->time timeout))
             (thread-state-set! running-thread 'blocked)
             (thread-yield!))))


    (define (thread-terminate! thread)
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
                    (scheduler)
                    (error "thread-join! didn't expect to get here")))))
            (if (srfi-18-exception? result)
                (raise result)
                result)))))))


    (define make-mutex
      (case-lambda
       (() (make-mutex #f))
       ((name) (new-mutex #f running-thread name #f))))


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
        (cond ((and (mutex-locked? mutex) (not (past-time? timeout)))
               (call-with-current-continuation
                (lambda (cont)
                  (thread-thunk-set!
                   running-thread
                   (lambda ()
                     (cont (mutex-lock! mutex timeout thread)))))))
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
       ((mutex) (mutex-unlock! mutex #f #f))
       ((mutex condition-variable)
        (mutex-unlock! mutex condition-variable #f))
       ((mutex condition-variable timeout)
        ;; XXX condition-variable and timeout
        (mutex-locked?-set! mutex #f)
        )))



    (define (condition-variable? obj)
      #f)

    (define (make-condition-variable . maybe-name)
      #f)

    (define (condition-variable-name condition-variable)
      #f)

    (define (condition-variable-specific condition-variable)
      #f)

    (define (condition-variable-specific-set! condition-variable obj)
      #f)

    (define (condition-variable-signal! condition-variable)
      #f)

    (define (condition-variable-broadcast! condition-variable)
      #f)


    (define (current-exception-handler)
      #f)


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
