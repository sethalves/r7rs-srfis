
(define (main-program)
  (and

   (equal? (list 3 2 1) (fold cons '() (list 1 2 3)))

   (= (find even? '(3 1 4 1 5 9)) 4)

   #t

   ))
