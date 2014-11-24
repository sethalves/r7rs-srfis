(define-library (srfi-tests 37 tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (scheme process-context)
          (srfi 37))
  (begin

(define options
 (list (option '(#\d "debug") #f #t
               (lambda (option name arg debug batch paths files)
                 (values (or arg "2") batch paths files)))
       (option '(#\b "batch") #f #f
               (lambda (option name arg debug batch paths files)
                 (values debug #t paths files)))
       (option '(#\I "include") #t #f
               (lambda (option name arg debug batch paths files)
                 (values debug batch (cons arg paths) files)))
       (option '(#\h "help") #f #f
               (lambda (option name arg debug batch paths files)
                 (usage)))
       ))



(define (usage)
  (display "usage...\n" (current-error-port))
 (exit 1))



(define (run-tests)
  (let ((args (command-line)))
    (let-values (((debug-level batch-mode include-paths files)
                  (args-fold (cdr args)
                             options
                             ;; unrecognized
                             (lambda (option name arg . seeds)
                               (error "Unrecognized option:" name))
                             ;; operand
                             (lambda (operand debug batch paths files)
                               (display "operand=") (write operand) (newline)
                               (display "files=") (write files) (newline)
                               (values debug batch paths (cons operand files)))
                             0      ; default value of debug level
                             #f     ; default value of batch mode
                             '()    ; initial value of include paths
                             '()    ; initial value of files
                             )))

      (newline)

      (display "debug level = ")
      (display debug-level)
      (newline)

      (display "batch mode = ")
      (display batch-mode)
      (newline)

      (display "include paths = ")
      (display (reverse include-paths))
      (newline)

      (display "files = ")
      (display (reverse files))
      (newline)

      #t
      )))



;; (define options
;;   (list (option '(#\h "help") #f #f
;;                 (lambda (option name arg files)
;;                   (usage)))))

;; (define (usage)
;;   (display "usage...\n" (current-error-port))
;;  (exit 1))

;; (define (main-program args)
;;   (let-values (((files)
;;                 (args-fold (cdr args)
;;                            options
;;                            ;; unrecognized
;;                            (lambda (option name arg . seeds)
;;                              (error "Unrecognized option:" name))
;;                            ;; operand
;;                            (lambda (operand files)
;;                              ;;(display "operand=") (write operand) (newline)
;;                              ;;(display "files=") (write files) (newline)
;;                              (values (cons operand files)))
;;                            '()    ; initial value of files
;;                            )))
;;     (for-each
;;      (lambda (file)
;;        (write file)
;;        (newline))
;;      files)))

))
