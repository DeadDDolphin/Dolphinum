pr(2):-!.
pr(X):-pr1(2,X).
pr1(X,X):-!.
pr1(I,X):-Y is X mod I,not(Y=0),I1 is I+1,pr1(I1,X).

npr_d(N,X):-npd(N,N,X).
npd(I,N,X):-Y is N mod I,Y=0,pr(I).
npd(I,N,X):-I1 is I-1,ndp(I1,N,X).
