fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.

fact1(N,X):-fact2(0,1,N,X).
fact2(N,K,N,K):-!.
fact2(I,K,N,X):-I1 is I+1,K1 is K*I1,fact2(I1,K1,N,X).
