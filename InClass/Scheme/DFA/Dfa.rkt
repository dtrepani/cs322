#lang racket

(require "State.rkt")

(define (make-state-assoc state-name)
  (cons state-name (make-state state-name)))

(define (in? item a-list)
  (if (null? a-list)
      #f
      (if (equal? item (car a-list))
          #t
          (in? item (cdr a-list)))))

; Implements code to build a dfa object form a dfa spec.
; A dfa-spec is a specification of a state machine
;	(states final-states initial-states transitions)
; Transistions is a spec of the delta function
;   ( ((state letter) next-state)* )
(define (make-dfa dfa-spec)
  (let
      ((states (map make-state-assoc (car dfa-spec)))
       (final-state-names (cadr dfa-spec))
       (start-state-name (caddr dfa-spec))
       (current-state '())
       (is-initalized #f))
    
    (define (get-state-by-name name)
      (cdr (assoc name states)))
    
    (define (add-transition spec)
      (((get-state-by-name (caar spec)) 'add-transition)
       (cadar spec)
       (get-state-by-name (cadr spec))))
    
    (define (reset)
      (begin
        (if (not is-initalized)
            (begin
              (set! is-initalized #t)
              (map add-transition (cadddr dfa-spec)))
            '())
        (set! current-state (get-state-by-name start-state-name))))

    (define (get-current-state)
      current-state)

    (define (is-final?)
      (in? ((current-state 'get-name)) final-state-names))

    (define (delta letter)
      (set! current-state ((current-state 'next-state) letter)))

    (define (delta-hat a-list)
      (map delta a-list))

    (define (send msg)
      (cond
        ((eq? msg 'reset) reset)
        ((eq? msg 'current-state) get-current-state)
        ((eq? msg 'is-final?) is-final?)
        ((eq? msg 'delta) delta)
        ((eq? msg 'delta-hat) delta-hat)
        (else (error "undefined message"))))

    send))

(provide make-dfa)