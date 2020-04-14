r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,I,B):-I1 is I+1, read(X), append(B,[X],B1),r_list(A,N,I1,B1).
w_list([]):-!.
w_list([H|T]):-write(H),nl,w_list(T).

prost(X):-read(A),pr_list(A,X).
pr_list(A,X):-bamba(A,2,[],X).
bamba(1,_,X,X):-!.
bamba(A,I,Z,X):-Y is A mod I, Y=0,append(Z,[I],Z2),A1 is A/I,bamba(A1,I,Z2,X),!.
bamba(A,I,Z,X):-I1 is I+1,bamba(A,I1,Z,X).
