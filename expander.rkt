#lang racket
(provide #%app #%top #%top-interaction)

(define-syntax-rule (drill-module-begin drill)
  (#%module-begin
   (displayln "TODO...")))
(provide (rename-out [drill-module-begin #%module-begin]))
