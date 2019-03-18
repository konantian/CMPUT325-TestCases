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

test('alternate 1', true(R == [a,1,b,2,c,3])) :-
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
/* ---------------------------------------------------------
Tests for Question 4.1
--------------------------------------------------------- */
:- begin_tests(q4_1_fullDB).

test('required 1', true(L == [])) :-
    required(cmput174, L).
test('required 2', true(L == [cmput174])) :-
    required(cmput175, L).
test('required 3', true(L == [cmput174, cmput175, cmput204, cmput272])) :-
    required(cmput340, L).
test('required 4', true(L == [cmput174, cmput175])) :-
    required(cmput201, L).
test('required 5', true(L == [cmput174, cmput175,cmput272])) :-
    required(cmput204, L).
test('required 6', true(L == [cmput174, cmput175, cmput201, cmput204, cmput229, cmput272])) :-
    required(cmput379, L).
test('required 7', true(L == [cmput174, cmput175, cmput204, cmput272, cmput291])) :-
    required(cmput391, L).
test('required 8', true(L == [cmput174, cmput175, cmput201, cmput204, cmput229, cmput272, cmput379])) :-
    required(cmput481, L).
test('required 9', true(L == [])) :-
    required(cmput328, L).
test('required 10', true(L == [cmput174, cmput175, cmput201, cmput204, cmput229, cmput272])) :-
    required(cmput325, L).

:- end_tests(q4_1_fullDB).

/* ---------------------------------------------------------
Tests for Question 4.2
--------------------------------------------------------- */
:- begin_tests(q4_2_fullDB).
test('can_take 1') :-
    findall(C,can_take([cmput174, cmput175, cmput229, cmput272, cmput325], C),L),
    permutation(L,[cmput101, cmput201, cmput204, cmput206, cmput210, cmput250, 
    cmput275, cmput291, cmput296,cmput297,cmput299,cmput396,cmput399,cmput400,cmput418,
    cmput419,cmput495,cmput496,cmput497,cmput498,cmput499]), !.
test('can_take 2') :-
    findall(C,can_take([cmput101,cmput174, cmput175, cmput204, cmput272], C),L),
    permutation(L,[cmput201, cmput206, cmput210, cmput250, cmput275,
     cmput291, cmput296, cmput297, cmput299, cmput304, cmput340, cmput366, cmput396,
     cmput399,cmput400,cmput418,cmput419,cmput495,cmput496,cmput497,cmput498,cmput499]), !.
test('can_take 3') :-
    findall(C,can_take([cmput101,cmput174, cmput175, cmput204,cmput206,cmput229, cmput272, cmput325], C),L),
    permutation(L,[cmput201, cmput210,cmput250,
    cmput275, cmput291, cmput296,cmput297,cmput299,cmput304,cmput340,cmput366,cmput396,cmput399,cmput400,cmput418,
    cmput419,cmput495,cmput496,cmput497,cmput498,cmput499]), !.
test('can_take 4') :-
    findall(C,can_take([], C),L),
    permutation(L,[cmput101, cmput174, cmput250, 
    cmput275, cmput296,cmput297,cmput299,cmput396,cmput399,cmput400,cmput418,
    cmput419,cmput495,cmput496,cmput497,cmput498,cmput499]), !.
test('can_take 5') :-
    findall(C,can_take([cmput174, cmput175, cmput272, cmput204], C),L),
    permutation(L,[cmput101, cmput201, cmput206, cmput210, cmput250, 
    cmput275, cmput291, cmput296,cmput297,cmput299,cmput304,cmput340,
    cmput366,cmput396,cmput399,cmput400,cmput418,
    cmput419,cmput495,cmput496,cmput497,cmput498,cmput499]), !.
:- end_tests(q4_2_fullDB).

/* ---------------------------------------------------------
Tests for Question 4.3
--------------------------------------------------------- */
:- begin_tests(q4_3_full_cycleDB).
test('in_cycle 1', all(Cycle == [[cmput174, cmput272, cmput174]])) :-
    in_cycle(cmput174, Cycle).
test('in_cycle 2', all(Cycle == [[cmput229, cmput429, cmput229]])) :-
    in_cycle(cmput229, Cycle).
test('in_cycle 3', all(Cycle == [[cmput272, cmput174, cmput272]])) :-
    in_cycle(cmput272, Cycle).
test('in_cycle 4', all(Cycle == [[cmput302, cmput302]])) :-
    in_cycle(cmput302, Cycle).
test('in_cycle 5', all(Cycle == [[cmput306, cmput340, cmput306]])) :-
    in_cycle(cmput306, Cycle).
test('in_cycle 6', all(Cycle == [[cmput340, cmput306, cmput340]])) :-
    in_cycle(cmput340, Cycle).
test('in_cycle 7', all(Cycle == [[cmput404, cmput404]])) :-
    in_cycle(cmput404, Cycle).
test('in_cycle 8', all(Cycle == [[cmput429, cmput229, cmput429]])) :-
    in_cycle(cmput429, Cycle).
test('in_cycle 9', all(Cycle == [])) :-
    in_cycle(cmput499, Cycle).
:- end_tests(q4_3_full_cycleDB).

:- run_tests(q1).
:- run_tests(q2).
:- run_tests(q3).
:- [a3_fullDB].
:- run_tests(q4_1_fullDB).
:- run_tests(q4_2_fullDB).
:- [a3_full_cycleDB].
:- run_tests(q4_3_full_cycleDB).

