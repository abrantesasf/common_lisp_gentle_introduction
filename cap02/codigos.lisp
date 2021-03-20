;;;;========================================================================;;;;
;;;; Common Lisp: A Gentle Introduction to Symbolic Computation             ;;;;
;;;; http://www.paulgraham.com/acl.html                                     ;;;;
;;;;------------------------------------------------------------------------;;;;
;;;; Capítulo: 2                                                            ;;;;
;;;;------------------------------------------------------------------------;;;;
;;;; Por: Abrantes Araújo Silva Filho                                       ;;;;
;;;;      abrantesasf@pm.me                                                 ;;;;
;;;;========================================================================;;;;


;;; 2.1: Lists are the most versatile data structure:
;;; -------------------------------------------------

;; Lisp = LISt Processing

;; Listas são versáteis pois servem para representar praticamente tudo:
;;    - conjuntos
;;    - tabelas
;;    - grafos
;;    - frases
;;    - funções


;;; 2.2: Uma lista se parece com o quê?
;;; -----------------------------------

;; Listas têm 2 formas de representação:
;;   - impressa (tela/papel)
;;   - interna  (na memória do computador)

;; Representação IMPRESSA:
;;   (1 2 3)
;;   (casa carro 3 nil)
;;   ((sapo perereca) (vaca boi))

;; Representação INTERNA:
;;   - Cadeia de CONS (cons cells)
;;   - Cada CONS consiste de 2 células de memória "adjacentes", e cada
;;     célula desse par (CONS) contém um PONTEIRO (assim, cada CONS contém
;;     dois ponteiros, um em cada célula):
;;        - PRIMEIRO PONTEIRO: sempre aponta para um elemento da lista;
;;        - SEGUNDO PONTEIRO:  sempre aponta para o próximo CONS na cadeira
;;          (ou para NIL se não há mais CONS na cadeia).


;;; 2.3: Lists of one element:
;;; --------------------------

;; Um símbolo e uma lista de um elemento não são a mesma coisa! A lista
;; (CASA) é representada por um CONS onde o ponteiro da primeira célula do CONS
;; aponta para o símbolo CASA:

;        |---|---|
;        |   |  ---> NIL
;        |---|---|
;          |
;          V
;        CASA

;;; 2.4: Nested Lists:
;;; ------------------

;; Listas podem ser ANINHADAS indefinidamente. Em uma lista aninhada o ponteiro
;; da primeira célula do CONS aponta para OUTRO cons que, este sim, aponta para
;; o elemento (símbolo) armazenado.

;; Listas que não são aninhadas são ditas PLANAS.


;;; 2.5: Length of lists:
;;; ---------------------

;; O tamanho de uma lista é o número de elementos que ela tem, no mesmo nível
;; (sem contar os elementos das listas aninhadas).


(length '(a (b c) d))
(length '(red green blue))
(length '(foo 937 gleep glorp))
(length '(roy (two white ducks) ((melted) (butter))))
(length '(casa))
(length 'casa)


;;; 2.6: NIL, the empty list
;;; ------------------------

;; NIL também corresponde a uma LISTA VAZIA, com 0 elementos.
;; Uma lista vazia (NIL), atenção!, NÃO TEM NENHUM CONS. Ela é representada
;; internamente apenas pelo símbolo NIL e, na forma impressa, por um par
;; de parênteses sem nenhum elemento: ()

;; NIL é a únia coisa que é um SÍMBOLO e também uma LISTA:
;;    nil = NIL = () = 'nil = 'NIL = '()

(length nil)
(length '())
(length '(a nil b))
(length '(nil nil nil nil nil))
(length '((nil nil nil nil)))

