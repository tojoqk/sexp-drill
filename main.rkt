#lang racket
(require syntax/strip-context
         "parser.rkt" "tokenizer.rkt")

(module+ reader
  (provide read-syntax))

(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port path)))
  (strip-context
   #`(module sexp-drill-mod sexp-drill/expander
       #,parse-tree)))
