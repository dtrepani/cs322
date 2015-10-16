#lang racket
; class State
;	a state has a name and an assoc list of next-states
;	be able to add new state transitions
;	inst vars
;		name
;		transitions
;	methods
;		(add-transition letter next-state)
;		(next-state letter)

(define (make-state state-name)
	(let ((name state-name)	(transitions '()))
		(define (get-name)
			name)
		(define (add-transition letter next-state)
			(set! transitions (cons (cons letter next-state) transitions)))
		(define (next-state letter)
			(cdr (assoc letter transitions)))
		(define (send msg)
			(cond
				((eq? msg 'get-name) get-name)
				((eq? msg 'add-transition) add-transition)
				((eq? msg 'next-state) next-state)
				(else (error "msg not understood" msg))))
		send))