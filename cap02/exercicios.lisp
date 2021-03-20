;;;;========================================================================;;;;
;;;; Common Lisp: A Gentle Introduction to Symbolic Computation             ;;;;
;;;; http://www.paulgraham.com/acl.html                                     ;;;;
;;;;------------------------------------------------------------------------;;;;
;;;; Exercícios: 2                                                          ;;;;
;;;;------------------------------------------------------------------------;;;;
;;;; Por: Abrantes Araújo Silva Filho                                       ;;;;
;;;;      abrantesasf@pm.me                                                 ;;;;
;;;;========================================================================;;;;


;;; Exercício 2.1:
;;; --------------

|---|---|  |---|---|  |---|---|  |---|---|  |---|---|  |---|---|
|   |  --->|   |  --->|   |  --->|   |  --->|   |  --->|   |  ---> NIL
|---|---|  |---|---|  |---|---|  |---|---|  |---|---|  |---|---|
  |          |          |          |          |          |
  V          V          V          V          V          V
 TO         BE         OR         NOT        TO         BE


;;; Exercício 2.2:
;;; --------------

; não     (A B (c)
; sim     ((A) (B))
; não     a b ) (c d)
; sim     (a (b (c)))
; sim     (((a) (b)) (c))


;;; Exercício 2.3:
;;; --------------


;;; Exercício 2.4:
;;; --------------

; ((bows arrows) (flowers chocolates))


;;; Exercício 2.5:
;;; --------------

(open the pod bay doors hal) ; 6

((open) (the pod bay doors) hal) ; 3

((1 2 3) (4 5 6) (7 8 9) (10 11 12)) ; 4

((one) for all (and (two (for me)))) ; 4

((q spades)
 (7 hearts)
 (6 clubs)
 (5 diamonds)
 (2 diamonds)) ; 5

((pennsylvania (the keystone state))
 (new-jersey (the garden state))
 (massachusetts (the bay state))
 (florida (the sunshine state))
 (new-york (the epire state))
 (indiana (the hoosier state))) ; 6


;;; Exercício 2.6:
;;; --------------

() = nil

(()) = (nil)

((())) = ((nil))

(() ()) = (nil nil)

(() (())) = (nil (nil))


;;; Exercício 2.7:
;;; --------------

