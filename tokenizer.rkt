#lang racket
(require brag/support)
(require "lexer.rkt")

(define (make-tokenizer in path)
  (port-count-lines! in)
  (lexer-file-path path)
  (thunk (drill-lexer in)))
(provide make-tokenizer)
