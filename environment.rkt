#lang racket/base
(provide #%datum #%app #%top #%top-interaction
         #%module-begin
         begin define let if lambda cond => else
         parameterize
         quote quasiquote unquote unquote-splicing
         eq? eqv? equal?
         cons car cdr null?)

(define current-target (make-parameter #f))
(provide current-target)

(define (check input expected-value)
  (define answer (apply (current-target) input))
  (cond
    [(equal? answer expected-value)
     #t]
    [(displayln "... NG!")
     (displayln (format "    input       : ~a" input))
     (displayln (format "    expected    : ~a" expected-value))
     (displayln (format "    your answer : ~a" answer))
     #f]))
(provide check)
