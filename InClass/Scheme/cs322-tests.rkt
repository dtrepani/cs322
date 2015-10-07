#lang racket/base
;include the test runner and the code to be tested
(require rackunit "cs322.rkt")

;the test suite
(define cs322-tests
  (test-suite 
   "Tests for Noobs"
   (test-case
    "my-length tests"
    (check-equal? (my-length '()) 0)
    (check-equal? (my-length '(1 2 3 4)) 4)
    (check-equal? (my-length '(1)) 1))
   (test-case
    "my-map tests"
    (check-equal? (my-map (lambda (x) (* x x)) '(1 2 3)) '(1 4 9))
    (check-equal? (my-map (lambda (x) (+ 2 x)) '(1 2 3)) '(3 4 5)))
   (test-case
    "my-map2 tests"
    (check-equal? (my-map2 (lambda (x) (* x x)) '(1 2 3)) '(1 4 9))
    (check-equal? (my-map2 (lambda (x) (+ 2 x)) '(1 2 3)) '(3 4 5)))
   (test-case
    "summation"
    (check-equal? (my-sum 1 100) 5050))
   (test-case
    "my-gcd"
    (check-equal? (my-gcd 30 42) 6)))) 

;load the test runner and run the tests
(require rackunit/gui)
(test/gui cs322-tests)