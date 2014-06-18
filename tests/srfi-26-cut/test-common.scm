(define (main-program)
  (equal? ((cut cons 2 <>) 5) (cons 2 5)))
