#lang racket

(require rackunit "State.rkt" "Dfa.rkt")

; Test state by using a simple two state machine
; ez represents even number of zeros
; oz represents odd number of zeros
(define state-tests
  (test-suite
   "Scheme HW 2"
   (test-case
    "state tests"
    (define ez (make-state 'ez))
    (define oz (make-state 'oz))
    ((ez 'add-transition) 0 oz)
    ((ez 'add-transition) 1 ez)
    ((oz 'add-transition) 0 ez)
    ((oz 'add-transition) 1 oz)
    (check-equal? ((ez 'get-name)) 'ez)
    (check-equal? ((ez 'next-state) 0) oz)
    (check-equal? ((ez 'next-state) 1) ez)
    (check-equal? ((oz 'get-name)) 'oz)
    (check-equal? ((oz 'next-state) 0) ez)
    (check-equal? ((oz 'next-state) 1) oz))
   (test-case
    "dfa tests"
    ; (Q F q0 transitions) dfa spec
    (define dfa (make-dfa
                 '((ez oz)
                   (ez)
                   ez
                   (((ez 0) oz)
                    ((ez 1) ez)
                    ((oz 0) ez)
                    ((oz 1) oz)))))
    
    ; dfa spec looking for a substring of 01
    (define dfa2 (make-dfa
                  '((s s0 s01)
                    (s01)
                    s
                    (((s 0) s0)
                     ((s 1) s)
                     ((s0 0) s0)
                     ((s0 1) s01)
                     ((s01 0) s01)
                     ((s01 1) s01)))))
    
    ((dfa 'reset))
    (check-equal? ((((dfa 'current-state)) 'get-name)) 'ez)
    (check-equal? ((dfa 'is-final?)) #t)
    ((dfa 'delta) 0)
    (check-equal? ((dfa 'is-final?)) #f)
    (check-equal? ((((dfa 'current-state)) 'get-name)) 'oz)
    ((dfa 'delta-hat) '(1 0 0 1 1 1 0 1 0 0)) ; odd number of zeroes take from false to true and vice versa
    (check-equal? ((dfa 'is-final?)) #t)
    ((dfa 'delta-hat) '(1 0 0 1 1 1 0 1 0 0))
    (check-equal? ((dfa 'is-final?)) #f)

    ((dfa2 'reset))
    (check-equal? ((dfa2 'is-final?)) #f)
    ((dfa2 'delta-hat) '(1 1 1 0 0 0 1 1 1 1 0 0 0))
    (check-equal? ((dfa2 'is-final?)) #t))))

(require rackunit/gui)
(test/gui state-tests)