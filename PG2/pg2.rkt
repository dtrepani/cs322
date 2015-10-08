#lang racket

(define (pick n a-list)
  (if (null? a-list)
     '()
     (if (= n 1)
         (car a-list)
         (pick (- n 1) (cdr a-list)))))

; NOT DONE
(define (my-reverse tree)
  (if (pair? tree)
      (append (my-reverse (cdr tree) (car tree)))
      (list tree)))

(define (deep-reverse tree)
  0)

(define (frontier tree)
  (if (pair? tree)
      (append (frontier (car tree)) (frontier (cdr tree)))
      (list tree)))

(provide pick my-reverse deep-reverse frontier)