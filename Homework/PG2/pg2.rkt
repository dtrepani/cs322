#lang racket

(define (pick n a-list)
  (if (= n 1)
    (car a-list)
    (pick (- n 1) (cdr a-list))))

(define (my-reverse a-list)
  0)

(define (deep-reverse a-list)
  0)

(define (frontier a-list)
  0)

(provide pick my-reverse deep-reverse frontier)