%% Tell prolog that we load definitions for course/1 and prerequisite/2
%% dynamically.
%%Author : Yuan Wang
:- dynamic(course/1).
:- dynamic(prerequisite/2).

%% Consult the assignment.
:- [assignment3].

/* ---------------------------------------------------------
Tests for Question 1
--------------------------------------------------------- */
:- begin_tests(q1).

test('alternate 1', tru(R == [a,1,b,2,c,3])) :-
    alternate([a,b,c],[1,2,3],R).
test('alternate 2', true(R == [a, d, b, e, c, f, 1, 3, 2, 4])) :-
    alternate([a,b,c,1,2],[d,e,f,3,4],R).
test('alternate 3', true(R == [a, 1, b, 2, c])) :-
    alternate([a,b,c],[1,2],R).
test('alternate 4', true(R == [])) :-
    alternate([],[],R).
test('alternate 5', true(R == [1,2])) :-
    alternate([1],[2],R).
test('alternate 6', true(R == [b,a])) :-
    alternate([b],[a],R).
test('alternate 7', true(R == [a,a,a,a,a,a,a])) :-
    alternate([a,a,a],[a,a,a,a],R).
test('alternate 8', true(R == [1,2,3,4,5,6,7,8,9,10])) :-
    alternate([1,3,5,7,9],[2,4,6,8,10],R).
:- end_tests(q1).

/* ---------------------------------------------------------
Question 2
--------------------------------------------------------- */
:- begin_tests(q2).

test('counti 1', all(N == [0])) :-
    counti([],N).
test('counti 2') :-
    counti([],0), !.
test('counti 3', all(N == [6])) :-
    counti([3,2,1,4,5,6],N).
test('counti 4', all(N == [18])) :-
    counti([[2,4,5],[1,3,5,7,9],7,[4,6],[1,2],3,7,[[[6,8,10]]]], N).
test('counti 5', all(N == [16])) :-
    counti([[1,2,[[[[3]]]],4,5,j],[[6,a],[[7]],8,b],c,[9,[[10,a]],11],[12,u,14,16],[3],m,4],N).
test('counti 6', all(N == [18])) :-
    counti([[2,4,6,u,i,o],[1,2],[a,b,c,d,e],[[4,i,9,m,h],[a,b,c]],[5,a,b,c,d],[7,8,9,10,13,14],[6,[5,[4]],12]], N).
test('counti 7', all(N == [21])) :-
    counti([k,[2],a,[a,d,1,b,v,x,s,6],2,a,d,[2,3,m,n,a,4,5,6],[1,2,3,0,4,5],11,2,4,6,9,0],N).
test('counti 8', all(N == [13])) :-
    counti([[4,5,x,6,y,z,7,[[[[[9]]]]]],[a,p,t,x,4,8,6,9],[s,i,l,v,e,r,b,u,l,l,e,t,2,0,1,9]],N).

:- end_tests(q2).

/* ---------------------------------------------------------
Question 3
--------------------------------------------------------- */
:- begin_tests(q3).

test('umem 1', all(X == [])) :-
    umem(X, []).
test('umem 2', all(X == [a,b])) :-
    umem(X, [a,a,b]).
test('umem 3', all(X == [a,b,c,d,e,f])) :-
    umem(X, [a,b,c,a,d,c,b,a,e,f]).
test('umem 4', all(X == [f,e,d,c,b,a])) :-
    umem(X, [f,f,e,e,d,d,d,c,c,c,c,b,a,a,a]).
test('umem 5', all(X == [10,9,8,7,6,5,4,3,2,1,0])) :-
    umem(X, [10,9,8,7,6,5,4,3,2,1,0]).
test('umem 6', all(X == [11,10,9,8,7,6,5,4,3,2,1,0])) :-
    umem(X, [11,10,9,9,9,10,8,7,8,7,9,6,5,5,6,4,4,3,6,2,1,2,0]).
test('umem 7', all(X == [f, a, 1, 2, 3, d, c, 4, 5,g,h,i])) :-
    umem(X, [f,f,a,a,f,1,1,2,3,d,c,a,1,4,5,g,h,i,h,f,4]).
test('umem 8 ', all(X == [1,a,2,b,3,c,4,d,e,f,g])) :-
    umem(X, [1,a,1,a,2,b,3,c,4,d,3,c,4,e,f,g]).

:- end_tests(q3).

:- run_tests(q1).
:- run_tests(q2).
:- run_tests(q3).