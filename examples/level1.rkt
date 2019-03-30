#lang sexp-drill

@require
(only racket/base
      #%app #%top #%datum
      define let if lambda cond => else
      quote quasiquote unquote unquote-splicing)

@description 再帰手続きについて

それでは、簡単な再帰手続きを記述する方法について説明しよう。

...
...

@question 二つのリストを連結しなさい

@require
(only racket/base cons car cdr null?)

@answer append

(define (append x y)
  (cond
    [(null? x) y]
    [else
     (cons (cdr x)
           (append (car x) (cdr y)))]))

@input
(list
 (for/list ([i (random 10)]) (random 100))
 (for/list ([i (random 10)]) (random 100)))

@description 末尾再帰手続きについて

@question リストを反転させなさい

@require
(only racket/base cons car cdr null?)

@answer reverse
(define (reverse lst)
  (define (rev lst acc)
    (cond
      [(null? lst) acc]
      [else
       (rev (cdr lst)
            (cons (car lst) acc))]))
  (rev lst '()))
