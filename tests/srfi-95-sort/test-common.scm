(define (main-program)

  (and
   (equal? (sort '(4 9 2 1) <) '(1 2 4 9))
   (equal? (sort '(4 9 2 1) >) '(9 4 2 1))
   (equal? (sort (vector 3 9 2) <) (vector 2 3 9))
   (let ((v (vector "ok" "a" "test" "ab")))
     (sort! v string-ci<?)
     (equal? v (vector "a" "ab" "ok" "test")))
   (sorted? (vector "a" "ab" "ok" "test") string-ci<?)
   (not (sorted? (vector "a" "ok" "ab" "test") string-ci<?))
   (equal? (merge '(1 4 6) '(1 2 3) <) '(1 1 2 3 4 6))

   ))
