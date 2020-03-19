fibo(1,1):-!.
fibo(2,1):-!.
fibo(N,X):-N1 is N-1,fibo(N1,X1),N2 is N-2,fibo(N2,X2),X is X1+X2.

fibo1(N,X):-fibo2(1,1,2,N,X).
fibo2(_,K,N,N,K):-!.
fibo2(J,K,I,N,X):-I1 is I+1, K1 is J+K, fibo2(K,K1,I1,N,X).
