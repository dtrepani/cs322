#lang racket
; Implements code to build a dfa object form a dfa spec.
; A dfa-spec is a specification of a state machine
;	(states final-states initial-states transitions)
; Transistions is a spec of the delta function
;   ( ((state letter) next-state)* )
(define (make-dfa dfa-spec)
  (let
      ((states '())
       (final-states '())
       (start-state-name (caddr dfa-spec))
       (current-state '()))
    (define (reset)
      '())
    (define (get-current-state)
      current-state)
    (define (isFinal?)
      #f)
    (define (delta letter)
      '())
    (define (delta-hat a-list)
      (map delta a-list))
    (define (send msg)
      (cond
        (eq?