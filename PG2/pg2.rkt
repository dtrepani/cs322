#lang racket

(define (pick n a-list)
  (cond
    ((null? a-list) '())
    ((= n 1) (car a-list))
    (else (pick (- n 1) (cdr a-list)))))

; NOT DONE
(define (my-reverse a-list)
  (if (not (pair? a-list))
      (car a-list)
      (list (cdr a-list) (car a-list))))
;  (cond
;    ((null? a-list) '())
;    ((pair? a-list) (cons (cdr a-list) (car a-list)))
;    (else (car a-list))))

; NOT DONE
(define (deep-reverse tree)
  (cond
    ((null? tree) '())
    ((list? tree) (append (deep-reverse (cdr tree)) (deep-reverse (car tree))))
    (else (list tree))))
; Mostly working answer:
;  (list (lambda (x)
;         (if (list? x)
;             (deep-reverse x)
;             x))
;       (reverse tree)))

(define (frontier tree)
  (if (pair? tree)
      (append (frontier (car tree)) (frontier (cdr tree)))
      (list tree)))

(provide pick my-reverse deep-reverse frontier)