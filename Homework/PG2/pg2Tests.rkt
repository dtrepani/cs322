#lang racket

(require rackunit "pg2.rkt")

(define pg2Tests
  (test-suite
   "Scheme HW 1"
   (test-case
    "pick tests"
    (check-equal? (pick 1 '(4 5 6)) 4)
    (check-equal? (pick 2 '(4 5 6)) 5)
    (check-equal? (pick 3 '(4 5 6)) 6)
    (check-equal? (pick 4 '(4 5 6)) '()))
   (test-case
    "my-reverse"
    (check-equal? (my-reverse '(1 2 3)) '(3 2 1))
    (check-equal? (my-reverse '((1 2) 3)) '(3 (1 2)))
    (check-equal? (my-reverse '()) '()))
   (test-case
    "deep-reverse"
    (check-equal? (deep-reverse '((1 2) 3)) '(3 (2 1)))
    (check-equal?
     (deep-reverse '(((1 2)(3 4))((5 (6 (7 8))))) )
     '(((((8 7) 6) 5))((4 3)(2 1)))))
   (test-case
    "frontier-of-tree"
    (check-equal? (frontier '(1 2 (3 (4 . 5) . 6) . (7 . 8))) '(1 2 3 4 5 6 7 8)))))

;load the test runner and run the tests
(require rackunit/gui)
(test/gui pg2Tests)