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
(test-case '1.2.13 (remove-identities '(- (- 0 x) 2)) '(- (- 0 x) 2))
(test-case '1.2.14 (remove-identities '(- (- 2 1) (- (- x 0) 0))) '(- (- 2 1) x))

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
