
(define (main-program)

  (let ((t0 (equal? (string-pad "555" 10 #\0) "0000000555"))
        (t1 (equal? (string-map
                     (lambda (c)
                       (cond ((eqv? c #\+) #\-)
                             ((eqv? c #\/) #\_)
                             (else c)))
                     "ok+ok/hi-hi")
                    "ok-ok_hi-hi"))
        (t2 (and (equal? (string-trim "abc   ") "abc   ")
                 (equal? (string-trim "   abc") "abc")
                 (equal? (string-trim "   abc" char-whitespace?) "abc")
                 (equal? (string-trim "   abc" #\space) "abc")
                 (equal? (string-trim "   abc" char-set:whitespace) "abc")))
        (t3 (and (equal? (string-trim "   abc" (lambda (x) #f)) "   abc")
                 (equal? (string-trim "   abc" #\x) "   abc")
                 (equal? (string-trim "   abc" char-set:graphic) "   abc")))
        (t4 (and (equal? (string-trim "  a b c  ") "a b c  ")
                 (equal? (string-trim "   abc" char-whitespace? 0 5) "ab")))
        (t5
         (and
          (equal? (string-trim-right "   abc") "   abc")
          (equal? (string-trim-right "abc   ") "abc")
          (equal? (string-trim-right "abc   " char-whitespace?) "abc")
          (equal? (string-trim-right "abc   " #\space) "abc")
          (equal? (string-trim-right "abc   " char-set:whitespace) "abc")))
        (t6
         (and
          (equal? (string-trim-right "abc   " (lambda (x) #f)) "abc   ")
          (equal? (string-trim-right "abc   " #\x) "abc   ")
          (equal? (string-trim-right "abc   " char-set:graphic) "abc   ")))
        (t7
         (and
          (equal? (string-trim-right "  a b c  ") "  a b c")
          (equal? (string-trim-right "abc   " char-whitespace? 1) "bc")
          ))
        (t8
         (and
          (equal? (string-trim-both "   abc") "abc")
          (equal? (string-trim-both "abc   ") "abc")
          (equal? (string-trim-both "    abc   ") "abc")))
        (t9
         (and
          (equal? (string-trim-both " abc " (lambda (x) #f)) " abc ")
          (equal? (string-trim-both " abc " #\x) " abc ")
          (equal? (string-trim-both " abc " char-set:graphic) " abc ")))
        (t10
         (and
          (equal? (string-trim-both " abc " #\space 2 3) "b")
          (equal? (string-trim-both " abc " #\space 2 2) "")
          ))
        (t11
         (and
          (string-prefix? "abc" "abcd")
          (string-prefix? "" "abcd")
          (not (string-prefix? "x" "abcd"))
          (not (string-prefix? "abcd" "abc"))
          (string-prefix-ci? "aBc" "abcd")
          (string-prefix? "abc" "bcd" 1)
          (string-prefix? "abcx" "bcd" 1 2)
          (not (string-prefix? "axd" "bcd" 1 2))
          (string-suffix? "bcd" "abcd")
          (not (string-suffix? "abcd" "bcd"))
          ))
        (t12
         (and
          (= (string-contains "abcdefg" "cde") 2)
          (= (string-contains "abcdefg" "cde" 2) 2)
          (not (string-contains "abcdefg" "cde" 3))
          (= (string-contains "abcdefg" "cde" 2 5) 2)
          (= (string-contains "abcdefg" "cde" 2 5 1) 3)
          (= (string-contains-ci "abcDefg" "cde") 2)
          (= (string-contains-ci "abcDefg" "cde" 2) 2)
          (not (string-contains-ci "abcDefg" "cde" 3))
          (= (string-contains-ci "abcDefg" "cde" 2 5) 2)
          (= (string-contains-ci "abcDefg" "cde" 2 5 1) 3)
          ))

        (t13
         (and
          (= (string-index "abcdefa" #\a) 0)
          (= (string-index "abcdefa" #\a 1) 6)
          (= (string-index "abcdefa" #\a 1 7) 6)
          (= (string-index "abcdef" #\f) 5)
          (= (string-index "abcdef" #\c) 2)
          (eq? (string-index "abcdef" #\g) #f)
          (eq? (string-index "" #\g) #f)

          (= (string-index-right "abcdefa" #\a) 6)
          (= (string-index-right "abcdefa" #\a 1 7) 6)
          (eq? (string-index-right "abcdefa" #\a 1 6) #f)
          (= (string-index-right "abcdefa" #\a 0 6) 0)
          (= (string-index-right "abcdef" #\f) 5)
          (= (string-index-right "abcdef" #\c) 2)
          (eq? (string-index-right "abcdef" #\g) #f)
          (eq? (string-index-right "" #\g) #f)

          (= (string-index "   abc   " char-set:letter) 3)
          (= (string-index-right "   abc   " char-set:letter) 5)

         ))

        (t14
         (and
          (= (string-skip "abcdefa" #\a) 1)
          (= (string-skip "abcdefa" #\a 1) 1)
          (= (string-skip "aaabbbccc" #\a) 3)
          (= (string-skip "aaabbbccc" #\a 1) 3)
          (= (string-skip-right "aaabbbccc" #\c 1) 5)
          (= (string-skip-right "aaabbbccb" #\c) 8)
          (= (string-skip-right "aaabbbccb" #\c 0 7) 5)
          (eq? (string-skip "" #\c) #f)
          (eq? (string-skip-right "" #\c) #f)

         ))

        (t15
         (and
          (equal? (reverse-list->string '(#\c #\b #\a)) "abc")))

        (t16
         (equal? (string-tokenize
                  "/a/b/c"
                  (char-set-complement
                   (string->char-set "/")))
                 '("a" "b" "c")))

        (t17
         (and
          (equal? (string-pad "abc" 5) "  abc")
          (equal? (string-pad "abc" 2) "abc")
          (equal? (string-pad-right "abc" 5) "abc  ")
          (equal? (string-pad-right "abc" 2) "abc")
          (equal? (string-pad "abcdefg" 5 #\space 1 3) "   bc")
          ))

        )

    (and t0 t1 t2 t3 t4 t5 t6
         t7 ;; fails on chicken (maybe fixed now)
         t8 t9 t10 t11 t12 t13 t14 t15 t16)

    ))
