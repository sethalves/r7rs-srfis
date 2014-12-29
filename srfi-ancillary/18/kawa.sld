(define-library (srfi-ancillary 18 kawa)
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
          (only (kawa lib syntax) synchronized)
          )

  (begin

    (define global-lock #t) ;; global lock
    (define running-thread (make-parameter #f))

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
      (new-thread thunk next previous state name kawa-future specific
                  end-result end-exception mutexes sleep-until
                  join-thread)
      thread?
      (thunk thread-thunk thread-thunk-set!)
      (next thread-next thread-next-set!)
      (previous thread-previous thread-previous-set!)
      (state thread-state thread-state-set!)
      (name thread-name thread-name-set!)
      (kawa-future thread-kawa-future thread-kawa-future-set!)
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


    (define-record-type <condition-variable>
      (new-condition-variable name blocked-threads specific)
      condition-variable?
      (name condition-variable-name condition-variable-name-set!)
      (blocked-threads condition-variable-blocked-threads
                       condition-variable-blocked-threads-set!)
      (specific condition-variable-specific condition-variable-specific-set!))


    (running-thread (new-thread
                     #f ;; thunk
                     #f ;; next
                     #f ;; previous
                     'runnable
                     "primordial"
                     #f ;; kawa-future
                     #f ;; specific
                     #f ;; end-result
                     #f ;; end-exception
                     '() ;; mutexes
                     #f ;; sleep until
                     #f ;; join thread
                     ))
    (thread-next-set! (running-thread) (running-thread))
    (thread-previous-set! (running-thread) (running-thread))


    (define (current-thread) (running-thread))


    (define (thread-ends thread end-result)
      (synchronized
       global-lock
       (thread-state-set! thread 'terminated)
       (thread-end-result-set! thread end-result)))


    (define make-thread
      (case-lambda
       ((thunk) (make-thread thunk "unknown"))
       ((thunk name)
        (let* ((was-prev-thread (thread-previous (running-thread)))
               (new-t (new-thread
                       #f
                       (running-thread)
                       was-prev-thread
                       'new
                       name
                       #f ;; kawa-future
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
          (thread-previous-set! (running-thread) new-t)
          (thread-next-set! was-prev-thread new-t)
          new-t))))


    (define (thread-start! thread)
      (synchronized
       global-lock
       (if (not (eq? (thread-state thread) 'new))
           (error "thread-start! called on non-new thread" thread))
       (thread-state-set! thread 'runnable))
      (thread-kawa-future-set! thread (future
                                       (parameterize
                                        ((running-thread thread))
                                        (thread-thunk thread))))
      thread)


    (define (thread-yield!) #t)


    (define (thread-sleep! timeout)
      (let ((for-seconds
             (- (time->seconds (->time timeout)) (current-second))))
        (invoke-static java.lang.Thread 'sleep for-seconds)))


    (define (thread-terminate! thread)
      ;; Causes an abnormal termination of the thread.
      (cond ((not (eq? (thread-state thread) 'terminated))
             ;; If the thread is not already terminated
             (thread-state-set! (running-thread) 'terminated)
             ;; all mutexes owned by the thread become unlocked/abandoned
             (synchronized
              global-lock
              (for-each
               (lambda (mutex)
                 (mutex-owner-set! mutex #f)
                 (mutex-locked?-set! mutex #f))
               (thread-mutexes thread))
              ;; a "terminated thread exception" object is stored in
              ;; the thread's end-exception field.
              (thread-end-exception-set!
               thread (new-exception 'terminated-thread #f))
              ;; XXX java docs say "stop" is depreciated.
              ((thread-kawa-future thread):stop))
             ;; If thread is the current thread, do not return.
             ;; ...
             )
            (else #f)))


    (define thread-join!
      (case-lambda
       ((thread)
        (synchronized
         global-lock
         (if (not (eq? thread-state 'terminated))
             (force (thread-kawa-future thread)))
         (if (thread-end-exception thread)
             (raise (thread-end-exception thread))))
        (thread-end-result thread))
       ((thread timeout)
        (error "thread-join! with timeout isn't implemented"))
       ((thread timeout timeout-value)
        (error "thread-join! with timeout isn't implemented"))))


    (define make-mutex
      (case-lambda
       (() (make-mutex #f))
       ((name)
        (new-mutex #f (running-thread) name #f))))


    (define (mutex-state mutex)
      (synchronized
       global-lock
       (cond ((and (mutex-locked? mutex) (mutex-owner mutex))
              (mutex-owner mutex))
             ((and (mutex-locked? mutex) (not (mutex-owner mutex)))
              'not-owned)
             ((and (not (mutex-locked? mutex)) (not (mutex-owner mutex)))
              'abandoned)
             ((and (not (mutex-locked? mutex)) (mutex-owner mutex))
              'not-abandoned))))


    (define mutex-lock!
      (case-lambda
       ((mutex) (mutex-lock! mutex #f (running-thread)))
       ((mutex timeout) (mutex-lock! mutex timeout (running-thread)))
       ((mutex timeout thread)
        (let ((timeout (->time timeout)))
          (let loop ()
            (let ((result
                   (synchronized
                    global-lock
                    (cond
                     ((and (mutex-locked? mutex) (not (past-time? timeout)))
                      'retry)

                     ((mutex-locked? mutex)
                      ;; timeout is over (or 0)
                      #f)

                     ((not thread)
                      ;; if thread is #f the mutex becomes locked/not-owned
                      (mutex-owner-set! mutex #f)
                      (mutex-locked?-set! mutex #t)
                      #t)

                     ((eq? (thread-state thread) 'terminated)
                      ;; if thread is terminated the mutex
                      ;; becomes unlocked/abandoned
                      (mutex-owner-set! mutex #f)
                      (mutex-locked?-set! mutex #f)
                      #f)

                     (else
                      ;; otherwise mutex becomes locked/owned with thread
                      ;; as the owner. 
                      (mutex-owner-set! mutex thread)
                      (mutex-locked?-set! mutex #t)
                      #t)))))
              (if (eq? result 'retry)
                  (begin (thread-sleep! 0.01) (loop))
                  result)))))))
               


    (define mutex-unlock!
      (case-lambda
       ((mutex)
        (synchronized global-lock (mutex-locked?-set! mutex #f)))
       ((mutex condition-variable)
        (mutex-unlock! mutex condition-variable #f))
       ((mutex condition-variable timeout)
        (let ((timeout (->time timeout)))
          (synchronized
           global-lock

           (condition-variable-blocked-threads-set!
            condition-variable
            (cons (running-thread)
                  (condition-variable-blocked-threads condition-variable)))

           (thread-sleep-until-set! (running-thread) (->time timeout))
           (thread-state-set! (running-thread) 'blocked)
           (mutex-locked?-set! mutex #f))

          ;; wait for condition-variable signal or timeout
          (let loop ()
            (let ((result
                   (synchronized
                    global-lock
                    (cond ((past-time? timeout) #f)
                          ((eq? (thread-state (running-thread)) 'blocked)
                           'retry)
                          (else #t)))))
              (if (eq? result 'retry)
                  (begin (thread-sleep! 0.01) (loop))
                  result)))))))


    (define make-condition-variable
      (case-lambda
       (() (make-condition-variable #f))
       ((name)
        (new-condition-variable name '() #f))))


    (define (condition-variable-signal! condition-variable)
      (synchronized
       global-lock
       (let ((blocked-threads
              (condition-variable-blocked-threads condition-variable)))
         (cond ((null? blocked-threads) #t)
               (else
                (condition-variable-blocked-threads-set!
                 condition-variable (cdr blocked-threads))
                (thread-state-set! (car blocked-threads) 'runnable))))))


    (define (condition-variable-broadcast! condition-variable)
      (synchronized
       global-lock
       (for-each
        (lambda (thread)
          (thread-state-set! thread 'runnable))
        (condition-variable-blocked-threads condition-variable))
       (condition-variable-blocked-threads-set! condition-variable '())))


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
