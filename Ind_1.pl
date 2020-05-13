pr(1):-!,fail.
pr(2):-!.
pr(X):-pr1(2,X).
pr1(X,X):-!.
pr1(I,X):-Y is X mod I,not(Y=0),I1 is I+1,pr1(I1,X).

interestingR(0):-!.
interestingR(X):-pr(X),Y is X div 10, interestingR(Y).

interestingL(X,K):-K>X*10,!.
interestingL(X,K):- Y is X mod K, pr(Y),K1 is K*10, interestingL(X,K1).

summa(1000000,Sum,Sum):-!.
summa(N,Sum,S):-interestingL(N,10),interestingR(N),write(N),nl,S1 is S +N,N1 is N+1,summa(N1,Sum,S1).
summa(N,Sum,S):-N1 is N+1,summa(N1,Sum,S).



