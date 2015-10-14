#lang racket

(define (pick n a-list)
  (cond
    ((null? a-list) '())
    ((= n 1) (car a-list))
    (else (pick (- n 1) (cdr a-list)))))

(define (my-reverse a-list)
  (if (null? a-list)
      '()
      (append (my-reverse (cdr a-list)) (list (car a-list)))))

(define (deep-reverse a-list)
  (if (pair? a-list)
      (my-reverse (map deep-reverse a-list))
      a-list))

(define (frontier tree)
  (if (pair? tree)
      (append (frontier (car tree)) (frontier (cdr tree)))
      (list tree)))

(provide pick my-reverse deep-reverse frontier)