(define-library (srfi-tests 60 tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (srfi 60))
  (begin
    (define (run-tests)

      ;; (write (arithmetic-shift -1 64))
      ;; (newline)

      (and
       (= (arithmetic-shift 1 1) 2)
       (= (arithmetic-shift 3 5) 96)
       (= (arithmetic-shift 96 -5) 3)
       (= (arithmetic-shift 1000 0) 1000)
       (= (arithmetic-shift -1 2) -4)
       (= (ash -1 2) -4)

       (= (bitwise-and 4 5) 4)
       (= (logand 4 5) 4)

       (or (= (bitwise-not 3) -4)
           (= (bitwise-not 3) 4611686018427387900)) ;; chicken


       ;; (= (arithmetic-shift -1 64) -18446744073709551616)

       (= (bitwise-ior 2354 121) 2427)
       (= (logior 2354 121) 2427)

       (= (bitwise-xor 568382 123817) 610199)
       (= (logxor 568382 123817) 610199)

       (= (bitwise-if #xff 23415 3453245) 3453303)
       (= (bitwise-merge #xff 23415 3453245) 3453303)


       ;; examples from srfi-60 document

       (equal? (number->string (bitwise-and #b1100 #b1010) 2) "1000")
       (equal? (number->string (bitwise-ior #b1100 #b1010) 2) "1110")
       (equal? (number->string (bitwise-xor #b1100 #b1010) 2) "110")

       (equal? (number->string (bitwise-not #b10000000) 2) "-10000001")
       (equal? (number->string (bitwise-not #b0) 2) "-1")
       (equal? (number->string (lognot #b0) 2) "-1")

       (= (bit-count #b10101010) 4)
       (= (bit-count 0) 0)

       (cond-expand
        ((or chicken sagittarius))
        (else
         (= (bit-count -2) 1)))

       (= (integer-length #b10101010) 8)
       (= (integer-length 0) 0)
       (= (integer-length #b1111) 4)

       (eq? (any-bits-set? #b0100 #b1011) #f)
       (eq? (any-bits-set? #b0100 #b0111) #t)
       (eq? (logtest #b0100 #b0111) #t)

       (= (bit-count #b10101010) 4)
       (= (logcount #b10101010) 4)
       (= (bit-count 0) 0)

       (cond-expand
        ((or chicken sagittarius))
        (else
         (= (bit-count -2) 1)))

       (= (integer-length #b10101010) 8)
       (= (integer-length 0) 0)
       (= (integer-length #b1111) 4)

       (= (log2-binary-factors 0) -1)
       (= (log2-binary-factors -1) 0)
       (= (log2-binary-factors -2) 1)
       (= (log2-binary-factors -3) 0)
       (= (log2-binary-factors -4) 2)
       (= (log2-binary-factors -5) 0)
       (= (log2-binary-factors -6) 1)
       (= (log2-binary-factors -7) 0)
       (= (log2-binary-factors -8) 3)
       (= (log2-binary-factors -9) 0)
       (= (log2-binary-factors -10) 1)
       (= (log2-binary-factors -11) 0)
       (= (log2-binary-factors -12) 2)
       (= (log2-binary-factors -13) 0)
       (= (log2-binary-factors -14) 1)
       (= (log2-binary-factors -15) 0)
       (= (log2-binary-factors -16) 4)
       (= (log2-binary-factors 0) -1)
       (= (log2-binary-factors 1) 0)
       (= (log2-binary-factors 2) 1)
       (= (log2-binary-factors 3) 0)
       (= (log2-binary-factors 4) 2)
       (= (log2-binary-factors 5) 0)
       (= (log2-binary-factors 6) 1)
       (= (log2-binary-factors 7) 0)
       (= (log2-binary-factors 8) 3)
       (= (log2-binary-factors 9) 0)
       (= (log2-binary-factors 10) 1)
       (= (log2-binary-factors 11) 0)
       (= (log2-binary-factors 12) 2)
       (= (log2-binary-factors 13) 0)
       (= (log2-binary-factors 14) 1)
       (= (log2-binary-factors 15) 0)
       (= (log2-binary-factors 16) 4)
       (= (first-set-bit 16) 4)

       (eq? (bit-set? 0 #b1101) #t)
       (eq? (bit-set? 1 #b1101) #f)
       (eq? (bit-set? 2 #b1101) #t)
       (eq? (bit-set? 3 #b1101) #t)
       (eq? (bit-set? 4 #b1101) #f)
       (eq? (logbit? 4 #b1101) #f)

       (equal? (number->string (copy-bit 0 0 #t) 2) "1")
       (equal? (number->string (copy-bit 2 0 #t) 2) "100")
       (equal? (number->string (copy-bit 2 #b1111 #f) 2) "1011")

       (equal? (number->string (bit-field #b1101101010 0 4) 2) "1010")
       (equal? (number->string (bit-field #b1101101010 4 9) 2) "10110")

       (equal? (number->string (copy-bit-field #b1101101010 0 0 4) 2)
               "1101100000")
       (equal? (number->string (copy-bit-field #b1101101010 -1 0 4) 2)
               "1101101111")
       (equal? (number->string (copy-bit-field #b110100100010000 -1 5 9) 2)
               "110100111110000")

       (equal? (number->string (ash #b1 3) 2) "1000")
       (equal? (number->string (ash #b1010 -1) 2) "101")

       (equal? (number->string (rotate-bit-field #b0100 3 0 4) 2) "10")
       (equal? (number->string (rotate-bit-field #b0100 -1 0 4) 2) "10")
       (equal? (number->string (rotate-bit-field #b110100100010000 -1 5 9) 2)
               "110100010010000")
       (equal? (number->string (rotate-bit-field #b110100100010000 1 5 9) 2)
               "110100000110000")

       (equal? (number->string (reverse-bit-field #xa7 0 8) 16) "e5")

       (equal? (integer->list 1001) '(#t #t #t #t #t #f #t #f #f #t))
       (equal? (integer->list 1001 11) '(#f #t #t #t #t #t #f #t #f #f #t))

       (equal? (list->integer '(#f #t #t #t #t #t #f #t #f #f #t)) 1001)

       (= (booleans->integer #t #t #f #t) 13)

       #t
       ))))
