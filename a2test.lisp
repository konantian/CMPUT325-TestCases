; Cmput 325 Winter 2019 Assignment 2
; Self Public test cases
; Yuan Wang

; How to use:
; First, load your assignment solution into SBCL
; Second, load this file.
; Third, fix the bugs and run this file again
; You can also copy+paste individual tests from here into SBCL

(defun test-case (ID Test Result)
    (if (equal Test Result)
        (format t "Test ~S OK~%" ID)
        (format t "FAIL: Test ~S expected ~S got ~S~%" ID Result Test)
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1. remove-identities

; basic tests for +
(test-case '1.1.1 (remove-identities '(+ x 1)) '(+ x 1))
(test-case '1.1.2 (remove-identities '(+ 1 0)) 1)
(test-case '1.1.3 (remove-identities '(+ 0 1)) 1)
(test-case '1.1.4 (remove-identities '(+ 1 x)) '(+ 1 x))

(test-case '1.1.5 (remove-identities '(+ (+ x 1) 1)) '(+ (+ x 1) 1))
(test-case '1.1.6 (remove-identities '(+ (+ 1 x) 0)) '(+ 1 x))
(test-case '1.1.7 (remove-identities '(+ 0 (+ x 1))) '(+ x 1))
(test-case '1.1.8 (remove-identities '(+ (+ 1 1) 0)) '(+ 1 1))
(test-case '1.1.9 (remove-identities '(+ 0 (+ 1 1))) '(+ 1 1))

(test-case '1.1.10 (remove-identities '(+ (+ 2 0) 0)) '2)
(test-case '1.1.11 (remove-identities '(+ (+ 0 3) (+ x 3))) '(+ 3 (+ x 3)))
(test-case '1.1.12 (remove-identities '(+ 0 (+ (+ x 0) 0))) 'x)
(test-case '1.1.13 (remove-identities '(+ (+ 2 2) (+ x 0))) '(+ (+ 2 2) x))
(test-case '1.1.13 (remove-identities '(+ (+ 1 0) (+ 0 x))) '(+ 1 x))
(test-case '1.1.14 (remove-identities '(+ (+ (+ 0 x) 0) (+ 2 x))) '(+ x (+ 2 x)))

; basic tests for -
(test-case '1.2.1 (remove-identities '(- 1 0)) 1)
(test-case '1.2.2 (remove-identities '(- 0 1)) '(- 0 1))
(test-case '1.2.3 (remove-identities '(- 1 1)) '(- 1 1))
(test-case '1.2.4 (remove-identities '(- 0 0)) 0)
(test-case '1.2.5 (remove-identities '(- 2 1)) '(- 2 1))
(test-case '1.2.6 (remove-identities '(- 2 2)) '(- 2 2))

(test-case '1.2.7 (remove-identities '(- (- x 0) 1)) '(- x 1))
(test-case '1.2.8 (remove-identities '(- (- 0 x) 0)) '(- 0 x))
(test-case '1.2.9 (remove-identities '(- (- (- 1 1) (- 2 0)) 0)) '(- (- 1 1) 2))
(test-case '1.2.10 (remove-identities '(- (- x x) (- x 1))) '(- (- x x) (- x 1)))
(test-case '1.2.11 (remove-identities '(- (- x 0) (- x 0))) '(- x x))

(test-case '1.2.12 (remove-identities '(- (- 2 0) 0)) 2)
(test-case '1.2.13 (remove-identities '(- (- 2 0) (- x 0))) '(- 2 x))
(test-case '1.2.14 (remove-identities '(- (- 0 x) 2)) '(- (- 0 x) 2))
(test-case '1.2.15 (remove-identities '(- (- 2 1) (- (- x 0) 0))) '(- (- 2 1) x))

; basic tests for *
(test-case '1.3.1 (remove-identities '(* x 2)) '(* x 2))
(test-case '1.3.2 (remove-identities '(* 2 x)) '(* 2 x))
(test-case '1.3.3 (remove-identities '(* 5 0)) '(* 5 0))
(test-case '1.3.4 (remove-identities '(* 1 0)) 0)
(test-case '1.3.5 (remove-identities '(* 0 1)) 0)
(test-case '1.3.6 (remove-identities '(* 0 x)) '(* 0 x))
(test-case '1.3.7 (remove-identities '(* x 0)) '(* x 0))


(test-case '1.3.8 (remove-identities '(* 2 1)) 2)
(test-case '1.3.9 (remove-identities '(* 1 3)) 3)
(test-case '1.3.10 (remove-identities '(* (* 1 1) 0)) 0)
(test-case '1.3.11 (remove-identities '(* (* 1 1) (* 3 1))) 3)
(test-case '1.3.12 (remove-identities '(* (* 3 1) (* x 0))) '(* 3 (* x 0)))
(test-case '1.3.13 (remove-identities '(* (* x 0) (* x 1))) '(* (* x 0) x))
(test-case '1.3.14 (remove-identities '(* (* 1 x) (* (* x 1) (* 2 1)))) '(* x (* x 2)))

; basic tests for mixing +, -, *
(test-case '1.4.1 (remove-identities '(+ 0 (* x (- 1 0)))) 'x)
(test-case '1.4.2 (remove-identities '(* 1 (+ x (- 0 0)))) 'x)
(test-case '1.4.3 (remove-identities '(+ 0 (+ 0 (+ 2 1)))) '(+ 2 1))
(test-case '1.4.4 (remove-identities '(+ (+ 2 0) (* 4 2))) '(+ 2 (* 4 2)))
(test-case '1.4.5 (remove-identities '(* 1 (+ x (- x x)))) '(+ X (- X X)))
(test-case '1.4.6 (remove-identities '(- 2 (+ x (* x 1)))) '(- 2 (+ x x)))
(test-case '1.4.7 (remove-identities '(- (+ 10 (* x 1)) (+ 10 10))) '(- (+ 10 x) (+ 10 10)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 2. tests for simplify-zeroes

(test-case 2.1 (simplify-zeroes 0) 0)
(test-case 2.2 (simplify-zeroes '(* x 0)) 0)
(test-case 2.3 (simplify-zeroes '(* 0 x)) 0)
(test-case 2.4 (simplify-zeroes '(* 0 0)) 0)
(test-case 2.5 (simplify-zeroes '(- x x)) 0)
(test-case 2.6 (simplify-zeroes '(- 0 0)) 0)

(test-case 2.7 (simplify-zeroes '(- x 0)) '(- x 0))
(test-case 2.8 (simplify-zeroes '(- 0 x)) '(- 0 x))
(test-case 2.9 (simplify-zeroes '(+ 0 0)) '(+ 0 0))
(test-case 2.10 (simplify-zeroes '(+ x 0)) '(+ x 0))
(test-case 2.11 (simplify-zeroes '(+ 0 x)) '(+ 0 x))

(test-case 2.12 (simplify-zeroes '(* (+ 1 2) 0)) 0)
(test-case 2.13 (simplify-zeroes '(- (+ 4 2) (+ 4 2))) 0)
(test-case 2.14 (simplify-zeroes '(- (* 3 0) (* 0 3))) 0)
(test-case 2.15 (simplify-zeroes '(- (+ 4 2) (+ 2 4))) '(- (+ 4 2) (+ 2 4)))
(test-case 2.16 (simplify-zeroes '(* (* 0 0) x)) 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3. tests for simplify
;Some examples where one type of simplification enables the other.
;All the examples from question 1 and 2 should still be simplified 
;at least as much as before, too.

(test-case 3.1 (simplify '(* 0 0)) 0)
(test-case 3.2 (simplify '(- 0 0)) 0)
(test-case 3.3 (simplify '(+ 0 0)) 0)
(test-case 3.4 (simplify '(+ x x)) '(+ x x))
(test-case 3.5 (simplify '(* 1 0)) 0)
(test-case 3.6 (simplify '(* 0 1)) 0)

(test-case 3.7 (simplify '(+ (+ (* x 0) x) 1)) '(+ x 1))
(test-case 3.8 (simplify '(* (- x 0) 2)) '(* x 2))
(test-case 3.9 (simplify '(+ (* x 0) 1)) 1)
(test-case 3.10 (simplify '(- (* x 0) (- 0 x))) '(- 0 (- 0 x)))

(test-case 3.10 (simplify '(* (* 1 x) (- x 0))) '(* x x))
(test-case 3.11 (simplify '(+ (- (* x 1) x) (* x (- 2 2)))) 0)
(test-case 3.12 (simplify '(* (* 1 x) (- x 0))) '(* x x))
(test-case 3.13 (simplify '(+ (- (- x (+ x 2)) 0) (+ 1 (- x x)))) '(+ (- X (+ X 2)) 1))
(test-case 3.14 (simplify '(+ (+ 0 0) (+ 1 (- x x)))) 1)
(test-case 3.15 (simplify '(- (+ 10 (* x 1)) (+ 10 10))) '(- (+ 10 x) (+ 10 10)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4. tests for normalize
(test-case 4.1 (normalize '((7 . 0) (3 . 4) (5 . 10)))
               '((5 . 10) (3 . 4) (7 . 0)))

(test-case 4.2 (normalize '((2 . 1) (2 . 2) (2 . 3) (2 . 4) (2 . 5)))
               '((2 . 5) (2 . 4) (2 . 3) (2 . 2) (2 . 1)))

(test-case 4.3 (normalize '((3 . 4) (4 . 3) (5 . 6) (6 . 5) (7 . 8) (8 . 7)))
               '((7 . 8) (8 . 7) (5 . 6) (6 . 5) (3 . 4) (4 . 3)))

(test-case 4.4 (normalize '((0 . 0) (0 . 0) (0 . 0))) NIL)

(test-case 4.5 (normalize '((0 . 0) (1 . 0) (2 . 0) (3 . 0) (4 . 0) (5 . 0))) '((15 . 0)))

(test-case 4.6 (normalize '((0 . 1) (0 . 2) (0 . 3) (0 . 4) (0 . 5))) NIL)

(test-case 4.7 (normalize '((0 . 1) (0 . 2) (0 . 3) (0 . 4) (0 . 5))) NIL)

(test-case 4.8 (normalize '((-1 . 3) (-2 . 3) (-3 . 3) (-4 . 3) (10 . 3))) NIL)

(test-case 4.9 (normalize '((-1 . 3) (-2 . 3) (2 . 3) (1 . 3))) NIL)

(test-case 4.10 (normalize '((-5 . 7) (-2 . 4) (3 . 2) (6 . 9))) '((6 . 9) (-5 . 7) (-2 . 4) (3 . 2)))

(test-case 4.11 (normalize '((2 . 2) (3 . 2) (4 . 2) (5 . 2) (6 . 2) (2 . 6) (2 . 3) (2 . 4) (2 . 5))) '((2 . 6) (2 . 5) (2 . 4) (2 . 3) (20 . 2)))

(test-case 4.12 (normalize '((4 . 2) (6 . 0) (6 . 233) (-7 . 2) (2 . 0) 
                            (2 . 1) (-1 . 233) (-2 . 233) (-3 . 233) (0 . 1)))
               '((-3 . 2) (2 . 1) (8 . 0)))

(test-case 4.13 (normalize '((-2 . 3) (1 . 3) (1 . 3))) NIL)

(test-case 4.14 (normalize '((-2 . 3) (1 . 3) (3 . 2) (1 . 3))) '((3 . 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5. tests for polynomial

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test-case '5.1.1
    (poly-add '((1 . 2) (1 . 1) (1 . 0)) 
              '((1 . 2) (1 . 1) (1 . 0)))
    '((2 . 2) (2 . 1) (2 . 0))
)

(test-case '5.1.2
    (poly-add '((5 . 2) (1 . 1)) 
              '((1 . 2) (2 . 1) (1 . 0)))
    '((6 . 2) (3 . 1) (1 . 0))
)

(test-case '5.1.3
    (poly-add '((1 . 4) (1 . 3) (1 . 1) (1 . 0)) 
              '((1 . 2) (1 . 1) (1 . 0)))
    '((1 . 4) (1 . 3) (1 . 2) (2 . 1) (2 . 0))
)

(test-case '5.1.4
    (poly-add nil '((4 . 3) (3 . 2) (2 . 1) (1 . 0)))
    '((4 . 3) (3 . 2) (2 . 1) (1 . 0))
)

(test-case '5.1.5
    (poly-add '((4 . 3) (3 . 2) (2 . 1) (1 . 0)) nil)
    '((4 . 3) (3 . 2) (2 . 1) (1 . 0))
)

(test-case '5.1.6
    (poly-add '((-5 . 0)) '((5 . 0)))
    nil
)

(test-case '5.1.7
    (poly-add '((5 . 0)) '((-5 . 0)))
    nil
)

(test-case '5.1.8
    (poly-add '((-2 . 0)) '((6 . 2)))
    '((6 . 2) (-2 . 0))
)

(test-case '5.1.9
    (poly-add '((2 . 2) (-2 . 1) (4 . 0)) '((4 . 3) (6 . 1) (-9 . 0)))
    '((4 . 3) (2 . 2) (4 . 1) (-5 . 0))
)

(test-case '5.1.10
    (poly-add '((-5 . 2) (3 . 1) (-7 . 0)) '((-5 . 3) (-3 . 1) (7 . 0)))
    '((-5 . 3) (-5 . 2))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5.1 tests for poly-subtract
(test-case '5.1.11
    (poly-subtract '((4 . 2) (5 . 1) (1 . 0)) 
                   '((4 . 2) (5 . 1) (1 . 0)))
    NIL
)

(test-case '5.1.12
    (poly-subtract NIL 
                   '((4 . 2) (5 . 1) (1 . 0)))
    '((-4 . 2) (-5 . 1) (-1 . 0))
)

(test-case '5.1.13
    (poly-subtract '((4 . 2) (5 . 1) (1 . 0))
      NIL)
    '((4 . 2) (5 . 1) (1 . 0))
)

(test-case '5.1.14
    (poly-subtract '((-6 . 0)) '((6 . 0)))
    '((-12 . 0))
)

(test-case '5.1.15
    (poly-subtract '((5 . 0)) '((5 . 0)))
    NIL
)

(test-case '5.1.16
    (poly-subtract '((12 . 4)) '((6 . 2)))
    '((12 . 4) (-6 . 2))
)

(test-case '5.1.17
    (poly-subtract '((5 . 5) (3 . 4) (7 . 3))
                   '((5 . 3) (3 . 1) (7 . 0)))
    '((5 . 5) (3 . 4) (2 . 3) (-3 . 1) (-7 . 0))
)

(test-case '5.1.18
    (poly-subtract '((5 . 5) (3 . 4) (7 . 3))
                   '((5 . 2) (3 . 1) (7 . 0)))
    '((5 . 5) (3 . 4) (7 . 3) (-5 . 2) (-3 . 1) (-7 . 0))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5.2 tests for poly-multiply
(test-case '5.2.1 (poly-multiply  nil '((4 . 2) (2 . 1) (3 . 0)))
                  'NIL
)

(test-case '5.2.2 (poly-multiply  '((4 . 2) (2 . 1) (3 . 0)) nil)
                  'NIL
)

(test-case '5.2.3 (poly-multiply  nil nil)
                  'NIL
)

(test-case '5.2.4 (poly-multiply  '((4 . 1) (-7 . 0)) '((2 . 1) (-9 . 0)))
                  '((8 . 2) (-50 . 1) (63 . 0))
)

(test-case '5.2.5 (poly-multiply  '((3 . 1) (-5 . 0)) '((2 . 2) (-4 . 1) (7 . 0)))
                  '((6 . 3) (-22 . 2) (41 . 1) (-35 . 0))
)

(test-case '5.2.6 (poly-multiply  '((2 . 2) (-5 . 1)) '((9 . 2) (6 . 1) (4 . 0)))
                  '((18 . 4) (-33 . 3) (-22 . 2) (-20 . 1))

)

(test-case '5.2.7 (poly-multiply '((3 . 2)) '((12 . 4) (-15 . 3) (21 . 2)))
                  '((36 . 6) (-45 . 5) (63 . 4))
)

(test-case '5.2.8 (poly-multiply '((3 . 2)) '((4 . 2) (-5 . 1) (7 . 0)))
                  '((12 . 4) (-15 . 3) (21 . 2))
)

(test-case '5.2.9 (poly-multiply '((4 . 1) (-5 . 0)) '((2 . 2) (3 . 1) (-6 . 0)))
                  '((8 . 3) (2 . 2) (-39 . 1) (30 . 0))
)

(test-case '5.2.10 (poly-multiply '((3 . 1) (2 . 0)) '((4 . 2) (-7 . 1) (5 . 0)))
                  '((12 . 3) (-13 . 2) (1 . 1) (10 . 0))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5.3 tests for polynomial
(test-case '5.3.1
    (polynomial 22)
    '((22 . 0))
)

(test-case '5.3.2
    (polynomial -25)
    '((-25 . 0))
)

(test-case '5.3.3
    (polynomial 0)
    nil
)

(test-case '5.3.4
    (polynomial 'x)
    '((1 . 1))
)

(test-case '5.3.5
    (polynomial '(+ x 1))
    '((1 . 1) (1 . 0))
)

(test-case '5.3.6
    (polynomial '(+ 1 0))
    '((1 . 0))
)

(test-case '5.3.7
    (polynomial '(+ 0 1))
    '((1 . 0))
)

(test-case '5.3.8
    (polynomial '(+ (+ x 1) 1))
    '((1 . 1) (2 . 0))
)

(test-case '5.3.9
    (polynomial '(+ (+ 2 0) 0))
    '((2 . 0))
)

(test-case '5.3.10
    (polynomial '(- (- x 0) 1))
    '((1 . 1) (-1 . 0))
)

(test-case '5.3.11
    (polynomial '(- (- 2 0) (- x 0)))
    '((-1 . 1) (2 . 0))
)

(test-case '5.3.12
    (polynomial '(* (* 1 1) (* 3 1)))
    '((3 . 0))
)

(test-case '5.3.13
    (polynomial '(* 1 (+ x (- x x))))
    '((1 . 1))
)

(test-case '5.3.14
    (polynomial '(- 2 (+ x (* x 1))))
    '((-2 . 1) (2 . 0))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 6 tests for print-pexpr
(test-case 6.1
    (print-pexpr '((-2 . 0)))
    "-2"
)

(test-case 6.2
    (print-pexpr '((1 . 2) (2 . 1) (5 . 0)))
    "x^2 + 2x + 5"
)

(test-case 6.3
    (print-pexpr '((5 . 1) (1 . 0)))
    "5x + 1"
)

(test-case 6.4
    (print-pexpr '((1 . 3) (-6 . 2) (11 . 1) (-6 . 0)))
    "x^3 - 6x^2 + 11x - 6"
)

(test-case 6.5
    (print-pexpr '((1 . 2) (-5 . 1) (6 . 0)))
    "x^2 - 5x + 6"
)

(test-case 6.6
    (print-pexpr '((1 . 3) (-10 . 2) (29 . 1) (-20 . 0)))
    "x^3 - 10x^2 + 29x - 20"
)

(test-case 6.7
    (print-pexpr nil)
    "0"
)

(test-case 6.8
    (print-pexpr '((1 . 100)))
    "x^100"
)

(test-case 6.9
    (print-pexpr '((1 . 3) (-12 . 2) (44 . 1) (-48 . 0)))
    "x^3 - 12x^2 + 44x - 48"
)

(test-case 6.10
    (print-pexpr '((1 . 3) (-9 . 2) (23 . 1) (-15 . 0)))
    "x^3 - 9x^2 + 23x - 15"
)

(test-case 6.11
    (print-pexpr '((1 . 4) (-31 . 3) (347 . 2) (-1649 . 1) (2772 . 0)))
    "x^4 - 31x^3 + 347x^2 - 1649x + 2772"
)

(test-case 6.12
    (print-pexpr '((1 . 4) (-16 . 3) (86 . 2) (-176 . 1) (105 . 0)))
    "x^4 - 16x^3 + 86x^2 - 176x + 105"
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Finally, tests that combine polynomial and print-pexpr
(test-case 'combined.1
    (let
        ((P (polynomial '(+ (- (- x (+ x 2)) 0) (+ 1 (- x x)))))
        )
        (print-pexpr P)
    )
    "-1"
)

(test-case 'combined.2
    (let
        ((P (polynomial '(+ (+ 0 0) (+ 1 (- x x)))))
        )
        (print-pexpr P)
    )
    "1"
)

(test-case 'combined.3
    (let* ((P '(+ x x))
           (P2 (list '* P P))
           (P4 (list '* P2 P2))
           (P8 (list '* P4 P4))
           (P16 (list '* P8 P8))
           (P32 (list '* P16 P16))
           (P32-PExpr (polynomial P32))
          )
        (print-pexpr P32-PExpr)
    )
    "4294967296x^32"
)

(test-case 'combined.4
    (let* ((P '(+ x 3))
           (P2 (list '* P P))
           (P4 (list '* P2 P2))
           (P8 (list '* P4 P4))
           (P16 (list '* P8 P8))
           (P32 (list '* P16 P16))
           (P32-PExpr (polynomial P32))
          )
        (print-pexpr P32-PExpr)
    )
    "x^32 + 96x^31 + 4464x^30 + 133920x^29 + 2912760x^28 + 48934368x^27 + 660613968x^26 + 7361127072x^25 + 69010566300x^24 + 552084530400x^23 + 3809383259760x^22 + 22856299558560x^21 + 119995572682440x^20 + 553825720072800x^19 + 2254861860296400x^18 + 8117502697067040x^17 + 25874539846901190x^16 + 73057524273603360x^15 + 182643810684008400x^14 + 403738949933071200x^13 + 787290952369488840x^12 + 1349641632633409440x^11 + 2024462448950114160x^10 + 2640603194282757600x^9 + 2970678593568102300x^8 + 2851851449825378208x^7 + 2303418478705113168x^6 + 1535612319136742112x^5 + 822649456680397560x^4 + 340406671729819680x^3 + 102122001518945904x^2 + 19765548681086304x + 1853020188851841"
)

(test-case 'combined.5
    (let* ((P '(* 1 x))
           (P2 (list '* P P))
           (P4 (list '* P2 P2))
           (P8 (list '* P4 P4))
           (P16 (list '* P8 P8))
           (P32 (list '* P16 P16))
           (P32-PExpr (polynomial P32))
          )
        (print-pexpr P32-PExpr)
    )
    "x^32"
)

(test-case 'combined.6
    (let* ((P '(- x 1))
           (P2 (list '* P P))
           (P4 (list '* P2 P2))
           (P8 (list '* P4 P4))
           (P16 (list '* P8 P8))
           (P32 (list '* P16 P16))
           (P32-PExpr (polynomial P32))
          )
        (print-pexpr P32-PExpr)
    )
    "x^32 - 32x^31 + 496x^30 - 4960x^29 + 35960x^28 - 201376x^27 + 906192x^26 - 3365856x^25 + 10518300x^24 - 28048800x^23 + 64512240x^22 - 129024480x^21 + 225792840x^20 - 347373600x^19 + 471435600x^18 - 565722720x^17 + 601080390x^16 - 565722720x^15 + 471435600x^14 - 347373600x^13 + 225792840x^12 - 129024480x^11 + 64512240x^10 - 28048800x^9 + 10518300x^8 - 3365856x^7 + 906192x^6 - 201376x^5 + 35960x^4 - 4960x^3 + 496x^2 - 32x + 1"
)

(test-case 'combined.7
    (let* ((P '(+ (+ x 1) 1))
           (P2 (list '* P P))
           (P4 (list '* P2 P2))
           (P8 (list '* P4 P4))
           (P16 (list '* P8 P8))
           (P32 (list '* P16 P16))
           (P32-PExpr (polynomial P32))
          )
        (print-pexpr P32-PExpr)
    )
    "x^32 + 64x^31 + 1984x^30 + 39680x^29 + 575360x^28 + 6444032x^27 + 57996288x^26 + 430829568x^25 + 2692684800x^24 + 14360985600x^23 + 66060533760x^22 + 264242135040x^21 + 924847472640x^20 + 2845684531200x^19 + 7724000870400x^18 + 18537602088960x^17 + 39392404439040x^16 + 74150408355840x^15 + 123584013926400x^14 + 182123809996800x^13 + 236760952995840x^12 + 270583946280960x^11 + 270583946280960x^10 + 235290388070400x^9 + 176467791052800x^8 + 112939386273792x^7 + 60813515685888x^6 + 27028229193728x^5 + 9652938997760x^4 + 2662879723520x^3 + 532575944704x^2 + 68719476736x + 4294967296"
)

(test-case 'combined.8
    (let* ((P '(+ (+ (* x 0) x) 1))
           (P2 (list '* P P))
           (P4 (list '* P2 P2))
           (P8 (list '* P4 P4))
           (P16 (list '* P8 P8))
           (P32 (list '* P16 P16))
           (P32-PExpr (polynomial P32))
          )
        (print-pexpr P32-PExpr)
    )
    "x^32 + 32x^31 + 496x^30 + 4960x^29 + 35960x^28 + 201376x^27 + 906192x^26 + 3365856x^25 + 10518300x^24 + 28048800x^23 + 64512240x^22 + 129024480x^21 + 225792840x^20 + 347373600x^19 + 471435600x^18 + 565722720x^17 + 601080390x^16 + 565722720x^15 + 471435600x^14 + 347373600x^13 + 225792840x^12 + 129024480x^11 + 64512240x^10 + 28048800x^9 + 10518300x^8 + 3365856x^7 + 906192x^6 + 201376x^5 + 35960x^4 + 4960x^3 + 496x^2 + 32x + 1"
)
































; 5.1 tests for poly-add