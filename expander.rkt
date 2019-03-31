#lang racket
(require racket/provide)
(require syntax/strip-context)
(require racket/exn)
(provide #%datum #%app #%top #%top-interaction
         (rename-out [drill-module-begin #%module-begin])
         (matching-identifiers-out #rx"^%%"
                                   (all-defined-out))
         repl)

(define-syntax-rule (drill-module-begin drill)
  (#%module-begin drill))

(define-syntax-rule (%%drill stx ...)
  (begin
    (current-print (lambda (x) (void)))
    (module+ test
      (require rackunit))
    stx
    ...
    (void)))

(define-syntax-rule (%%description . x)
  (void))

(define current-title (make-parameter #f))

(define-syntax-rule (%%question _ name title _ answer test)
  (begin
    (define name (make-base-empty-namespace))
    (parameterize ([current-namespace name]
                   [current-title title])
      (namespace-require 'sexp-drill/environment)
      (display (format "~a: " (current-title)) )
      (with-handlers ([exn:fail?
                       (lambda (e)
                         (displayln "... NG!")
                         (displayln (exn->string e)))])
        answer
        (define-values (id sexprs) test)
        (when (andmap
               (lambda (sexpr)
                 (eval `(parameterize ([current-target ,id])
                          ,sexpr)))
               sexprs)
          (displayln "... OK!"))))
    (void)))

(define (%%introduction x)
  (void))

(define (%%containts . xs)
  (apply string-append xs))

(define-syntax-rule (%%require x ...)
  (require x ...))

(define (%%sexprs . strs)
  (port->list read
              (open-input-string
               (apply string-append strs))))

(define-syntax-rule (%%answer _ sexprs)
  (eval `(begin ,@sexprs)))

(define-syntax-rule (%%test _ id sexprs)
  (values 'id sexprs))

(define (repl ns)
  (parameterize ([current-namespace ns])
    (read-eval-print-loop)))
