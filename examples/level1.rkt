#lang racket
(require "../main.rkt")

(define-question ?append?
  "二つのリストを渡してつなぎ合わせる関数 `append` を作成せよ"
  append
  append
  (["第一引数が空リストの場合" (thunk (list '() (list 1 2 3)))]
   ["両方とも空リストでない場合" (thunk (list '(a b c) '(1 2 3)))])
  (only racket/base car cons cdr null?))
