#lang sexp-drill
@description "再帰手続きについて"

簡単な再帰手続きを記述する方法について説明しよう。

@question append "二つのリストを連結しなさい"

@answer

(define (append x y)
  (cond
    [(null? x) y]
    [else
     (cons (car x)
           (append (cdr x) y))]))

@test append

(check '((1 2 3) (a b c)) '(1 2 3 a c b))

@description "末尾再帰手続きについて"

@question reverse "リストを反転させなさい"

@answer

@test reverse

