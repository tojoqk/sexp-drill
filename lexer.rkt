#lang racket
(require brag/support)

(define drill-lexer
  (lexer-src-pos
   [(:or "@description" "@question"
         "@answer" "@require" "@input")
    (token lexeme lexeme)]
   [(:or (:: "\n"
             (:& (char-complement "@")
                 (char-complement "\n"))
             (:* (char-complement "\n")))
         "\n")
    (token 'LINE lexeme)]
   [(:+ (char-complement (char-set " \n@()[]{}\",'`;#|\\")))
    (token 'IDENTIFIER (string->symbol lexeme))]
   [whitespace (token lexeme #:skip? #t)]
   [(:+ (char-set "0123456789"))
    (token 'INTEGER (string->number lexeme))]
   ["(" (token 'LEFT-PAREN lexeme)]
   [")" (token 'RIGHT-PAREN lexeme)]
   [(:or (from/to "\"" "\""))
    (token 'STRING
           (substring lexeme
                      1 (sub1 (string-length lexeme))))]
   [(eof) (void)]))
(provide drill-lexer)
