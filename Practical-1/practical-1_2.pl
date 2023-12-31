male(jonathan).
male(john).
male(kelly).
male(arnold).
male(louise).
female(jenifer).
female(marry).
female(martha).
female(alies).
female(nancy).
parent(jonathan,martha).
parent(jonathan,john).
parent(jonathan,arnold).
parent(jenifer,martha).
parent(jenifer,john).
parent(jenifer,arnold).
parent(john,kelly).
parent(john,alies).
parent(arnold,nancy).
parent(arnold,louise).
mother(M,C):-
    female(M),
    parent(M,C).
father(F,C):-
    male(F),
    parent(F,C).

son(S,P):-
    male(S),
    parent(P,S).
daughter(D,P):-
    female(D),
    parent(P,D).
grandfather(GF,C):-
    male(GF),
    parent(GF,M),
    parent(M,C).
grandmother(GM,C):-
    female(GM),
    parent(GM,F),
    parent(F,C).
brother(B,S):-
    male(B),
    parent(P,B),
    parent(P,S).
sister(S,D):-
    female(S),
    parent(P,D),
    parent(P,S).
uncle(U,C):-
    brother(U,P),
    parent(P,C).
aunt(A,C):-
    sister(A,P),
    parent(P,C).
nephew(C,P):-
    male(C),
    sister(P,A),
    parent(A,C).
cousinb(C1,C2):-
    parent(A,C1),
    parent(B,C2),
    brother(A,B).
cousins(C1,C2):-
    parent(A,C1),
    parent(B,C2),
    sister(A,B).
niece(C,P):-
    female(C),
    brother(P,A),
    parent(A,C).