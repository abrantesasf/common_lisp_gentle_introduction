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


;;; 2.7: Equality of lists
;;; ----------------------

;; Duas listas são iguais (EQUAL) se seus elementos também forem iguais
;; (se as cadeias de CONS também forem iguais).

(equal '(a (b c) d) '(a b (c d)))


;;; 2.8: First, Second, Third, and rest
;;; -----------------------------------

;; Funções primitivas para extrair elementos de uma lista:
;;   - first
;;   - second
;;   - third
;;   - rest

(first '(a b c d))
(second '(a b c d))
(third '(a b c d))
(rest '(a b c d))
(rest (rest '(a b c d)))

(defun my-second (lst)
  (first (rest lst)))

(my-second '(a b c d))


;;; 2.9: Functions operates on pointers:
;;; ------------------------------------

;; O input de uma função não é o objeto propriamente dito, uma lista ou um
;; símbolo, mas, sim, um PONTEIRO até o objeto.

;; Quando enviamos uma lista para uma função, não enviamos a lista em si:
;; estamos enviando um PONTEIRO para o primeiro CONS da lista.

;; Quando a função retorna uma lista, não está retornando a lista em si:
;; está retornando um PONTEIRO para o primeiro CONS desse lista resultado.


;;; 2.10: Car and Cdr
;;; -----------------

;; Um CONS é um par de células, cada uma contendo um ponteiro: a primeira célula
;; tem um ponteiro que aponta para o conteúdo, e a segunda célula tem um
;; ponteiro que aponta para NIL ou para outro CONS:

[*|*]--->NIL
 |
 v
CONTEUDO

[*|*]----->[*|*]--->NIL
 |          |
 v          v
CONTEUDO   CONTEUDO

;; A primeira célula em um CONS é chamada de:
;;    CAR: Contens of Address portion of Register

;; A segunda célula em um CONS é chamada de:
;;   CDR: Contents of Decrement portion of Regiter

;; Além disso, CAR e CDR também são funções primitivas do Lisp:
;;   - car: retorna o ponteiro da célula CAR
;;   - cdr: retorna o ponteiro da célula CDR

(car '(a b c d e))
(cdr '(a b c d e))

;; Note que a função FIRST retorna o CAR de uma lista, e
;; a função REST retorna o CDR de uma lista.

;; Se a lista tem um único elemento, CDR retorna NIL:

[*|*]--->NIL
 |
 v
 A

(cdr '(a))

[*|*]--->NIL
 |
 v
[*|*]--->[*|*]--->NIL
 |        |
 v        v
BOI      VACA

(car '((boi vaca)))
(cdr '((boi vaca)))

;; As funções CAR e CDR podem ser combinadas de diversas formas, e Lisp
;; tem várias funções built-in com essas combinações.

(defun car-da-cdr (lst)
  (car (cdr lst)))

(car-da-cdr '(a b c d e))

;; CAR da CDR
(cadr '(a b c d e))

;; CAR da CDR da CDR
(caddr '(a b c d e))

;; CAR da CDR da CDR da CDR
(cadddr '(a b c d e))
