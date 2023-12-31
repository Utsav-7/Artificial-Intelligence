likes(dan,sally).
likes(sally,dan).
likes(josh,brinly).
friendship(X,Y):-
    likes(X,Y);
    likes(Y,X).
