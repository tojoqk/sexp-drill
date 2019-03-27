#lang racket/base

(struct question (name
                  description procedure-name
                  answer input-cases
                  require-spec))

(define-syntax define-question
  (syntax-rules ()
    [(_ name
        description
        procedure-name
        answer
        ([case-description input] ...)
        require-spec)
     (begin
       (define name
         (question 'name
                   description
                   procedure-name
                   answer
                   (list (cons case-description input) ...)
                   'require-spec))
       (provide name))]))
(provide define-question)

(define (question-test question code)
  (define ns (make-base-empty-namespace))
  (define input-cases (question-input-cases question))
  (define procedure-name (question-procedure-name question))
  (parameterize ([current-namespace ns])
    (namespace-require '(only racket/base #%app #%top #%datum define if cond else apply quote))
    (namespace-require (question-require-spec question))
    (eval code)
    (andmap
     (lambda (input-case)
       (displayln (car input-case))
       (define args ((cdr input-case)))
       (equal?
        (apply (question-answer question) args)

        (eval `(apply ,procedure-name ',args))))
     input-cases)))
(provide question-test)
