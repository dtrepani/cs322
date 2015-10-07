#lang racket

(define (my-gcd a b)
  (if (= b 0)
      a
      (my-gcd b (remainder a b))))

(define (my-sum start end)
  (if (= start end)
      end
      (+ start (my-sum (+ start 1) end))))

(define (squared x) (* x x))

(define (my-sum-f start end f)
  (if (= start end)
      (f end)
      (+ (f start) (my-sum-f (+ start 1) end f))))

(define (my-length a-list)
  (if (null? a-list)
      0
      (+ 1 (my-length (cdr a-list)))))

(define (my-map fn a-list)
  (if (null? a-list)
      '()
      (cons (fn (car a-list)) (my-map fn (cdr a-list)))))
      
(define (my-map2 fn a-list)
  (define (my-map-helper fn in-list out-list)
    (if (null? in-list)
        out-list
        (my-map-helper 
         fn 
         (cdr in-list) 
         (append out-list (list (fn (car in-list)))))))
  (my-map-helper fn a-list '()))
  
(provide my-gcd my-sum my-length my-map my-map2)


  
  
  
  
  
  
  
  
  
  