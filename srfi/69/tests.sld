(define-library (srfi 69 tests)
  (export run-tests)
  (import (scheme base)
          (srfi 69))
  (begin
    (define (run-tests)

      (let ((ht (make-hash-table))
            (ht-copy #f)
            (ht-a (make-hash-table))
            (ht-b (make-hash-table)))
        (hash-table-set! ht "ok" "hi")
        (hash-table-set! ht "bluh" "fum")
        (hash-table-set! ht "x" "a")
        (hash-table-set! ht "x" "b")
        (set! ht-copy (hash-table-copy ht))
        (hash-table-delete! ht "bluh")

        (hash-table-update!/default
         ht-copy "cons" (lambda (current-list) (cons 1 current-list)) '())
        (hash-table-update!
         ht-copy "cons" (lambda (current-list) (cons 2 current-list)))
        (hash-table-update!
         ht-copy "cons" (lambda (current-list) (cons 3 current-list)))

        (hash-table-set! ht-a "a" 1)
        (hash-table-set! ht-a "b" 2)

        (hash-table-merge! ht-a ht-b)

        (and
         (hash-table? ht)
         (equal? (hash-table-ref ht "ok") "hi")
         (equal? (hash-table-ref ht "x") "b")
         (equal? (hash-table-ref/default ht "bluh" "buh") "buh")
         (hash-table-exists? ht "ok")
         (not (hash-table-exists? ht "bluh"))
         ;; (= (length (hash-table-keys ht)) 2)
         ;; (member "ok" (hash-table-keys ht))
         ;; (member "x" (hash-table-keys ht))
         ;; (not (member "bluh" (hash-table-keys ht)))
         ;; (= (length (hash-table-values ht)) 2)
         ;; (member "hi" (hash-table-values ht))
         ;; (member "b" (hash-table-values ht))
         ;; (not (member "fum" (hash-table-values ht)))
         ;; (equal? (assoc "ok" (hash-table->alist ht)) '("ok" . "hi"))
         (not (assoc "bluh" (hash-table->alist ht)))

         (equal? (assoc "c"
                        (hash-table->alist (alist->hash-table '(("a" . "b")
                                                                ("c" "d")
                                                                ("e" . "f")))))
                 (list "c" "d"))

         (equal? (hash-table-ref ht-copy "cons") '(3 2 1))


         ;; (hash-table-exists? ht-copy "bluh")

         (= (hash-table-ref ht-a "b") 2)

         )))))
