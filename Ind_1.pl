pr(2):-!.
pr(X):-pr1(2,X).
pr1(X,X):-!.
pr1(I,X):-Y is X mod I,not(Y=0),I1 is I+1,pr1(I1,X).
getR(X):-lalala(0,X).
lalala(K,X):-X1 is

chisla(S):-chis(0,S,999999),write(S).
chis(S,S,X):-usech(X),S1 is S+X,X1 is X-1,chis(S1,S,X1).
usechL(2):-!.
usechL(3):-!.
usechL(5):-!.
usechL(7):-!.
usechL(X):-pr(X),X1 is X/10, usechL(X1).
usechR(2):-!.
usechR(3):-!.
usechR(5):-!.
usechR(7):-!.
usechR(X):-pr(X),X1


