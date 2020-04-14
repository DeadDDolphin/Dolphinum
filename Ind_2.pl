r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,I,B):-I1 is I+1, read(X), append(B,[X],B1),r_list(A,N,I1,B1).
w_list([]):-!.
w_list([H|T]):-write(H),nl,w_list(T).

prost(Z):-read(A),pr_list(A,Z).
pr_list(A,Z):-bamba(A,2,Z,[]).
bamba(A,A,Z,Z):-!.
bamba(1,_,Z,Z):-fail.
bamba(A,I,Z,Z1):-Y is A mod I, Y=0,append(Z1,[I],K),A1 is A/I,bamba(A1,I,K,K),!.
bamba(A,I,Z,Z):-I1 is I+1,I<A,bamba(A,I1,Z,Z).
