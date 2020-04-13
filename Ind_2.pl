r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,I,B):-I1 is I+1, read(X), append(B,[X],B1),r_list(A,N,I1,B1).
w_list([]):-!.
w_list([H|T]):-write(H),nl,w_list(T).

prost:-read(A),pr_list(A,Z),w_list(Z).
pr_list(A,[]):-bamba(A,2,[]).
bamba(A,A,Z):-!.
bamba(1,_,_):-fail.
bamba(A,I,Z):-Y is A mod I, Y=0,append(Z,[I],Z1),A1 is A/I,bamba(A1,I,Z1),!.
bamba(A,I,Z):-I1 is I+1,I<A,bamba(A,I1,Z).
