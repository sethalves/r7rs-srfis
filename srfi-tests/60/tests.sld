(define-library (srfi-tests 60 tests)
  (export run-tests)
  (import (scheme base)
          (srfi 60))
  (begin
    (define (run-tests)

      ;; (display (arithmetic-shift 1 1))
      ;; (newline)
      ;; (display (arithmetic-shift 3 5))
      ;; (newline)
      ;; (display (arithmetic-shift 96 -5))
      ;; (newline)
      ;; (display (arithmetic-shift 1000 0))
      ;; (newline)


      (and
       (= (arithmetic-shift 1 1) 2)
       (= (arithmetic-shift 3 5) 96)
       (= (arithmetic-shift 96 -5) 3)
       (= (arithmetic-shift 1000 0) 1000)
       (= (arithmetic-shift -1 2) -4)

       ;; (equal? (integer64->bitvector 0)
       ;;         (vector #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
       ;;                 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
       ;;                 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
       ;;                 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f))
       ;; (equal? (integer64->bitvector 8)
       ;;         (vector #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
       ;;                 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
       ;;                 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
       ;;                 #f #f #f #f #f #f #f #f #f #f #f #f #t #f #f #f))
       ;; (equal? (integer64->bitvector 128)
       ;;         (vector #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
       ;;                 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
       ;;                 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
       ;;                 #f #f #f #f #f #f #f #f #t #f #f #f #f #f #f #f))

       ;; (let loop ((test-numbers
       ;;             (list 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
       ;;                   19 20 21 22 23 30 41 52 86 150 365 670 1022 1023
       ;;                   1024 1025 8000 20222 45000 65535 65536 65537
       ;;                   128000 256000 512000 1000000 10000000 100000000)))
       ;;   (cond ((null? test-numbers) #t)
       ;;         ((= (bitvector->integer64 (integer64->bitvector (car test-numbers)))
       ;;             (car test-numbers))
       ;;          (loop (cdr test-numbers)))
       ;;         (else #f)))


       (= (bitwise-and 4 5) 4)

       (or (= (bitwise-not 3) -4)
           (= (bitwise-not 3) 4611686018427387900)) ;; chicken


       (= (arithmetic-shift -1 64) -18446744073709551616)

       ))))
