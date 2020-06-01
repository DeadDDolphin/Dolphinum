read_str(A):-get0(X),r_str(X,A,[]).

del_1st([H|T],T).

r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

write_str([]):-!.
write_str([H|T]):-write(H),write_str(T).
write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

get_graph_edges(V,E):-get_V(V),write(V),nl,write("Input number of edges: "),nl,get_edges(V,E),write(E).

	get_V(V):-write("Input number of vertexes: "),read(N),write("Vertexes: "),nl,N1 is N+1,get_V(V1,N1),del_1st(V1,V).
	get_V([],0):-!.
	get_V([H|T],N):-read_str(X),name(H,X),N1 is N-1,get_V(T,N1).

	get_edges(V,E):-read(M),get0(X),get_edges(V,E,[],M,0).
	get_edges(V,E,E,M,M):-!.
	get_edges(V,E,Edges,M,Count):-get_edge(V,Edge),append(Edges,[Edge],E1),
								Count1 is Count+1,get_edges(V,E,E1,M,Count1).



check_vertex([V1|_],V1):-!.
check_vertex([_|T],V1):-check_vertex(T,V1).

get_edge(V,[V1,V2]):-write("Input edge: "),nl,read_str(X),name(V1,X),check_vertex(V,V1),
						read_str(Y),name(V2,Y),check_vertex(V,V2).


related(V,[[V,V1]|_],V1):-!.
related(V,[[V1,V]|_],V1):-!.
related(V,[E|T],V1):-related(V,T,V1).

adjacent(V1,V,E,Sm):-adjacent(V1,V,E,Sm,[]).
adjacent(_,[],_,Sm,Sm):-!.
adjacent(V1,[V2|T],E,Sm,S):-related(V1,E,V2),append(S,[V2],S1),adjacent(V1,T,E,Sm,S1),!.
adjacent(V1,[_|T],E,Sm,S):-adjacent(V1,T,Edges,Sm,S).


findDegree(V,E,Deg):-findDegree(V,E,Deg,0).
findDegree(_,[],Deg,Deg):-!.
findDegree(V,[[V,_]|T],Deg,I):-I1 is I+1,findDegree(V,T,Deg,I1),!.
findDegree(V,[[_,V]|T],Deg,I):-I1 is I+1,findDegree(V,T,Deg,I1),!.
findDegree(V,[_|T],Deg,I):-findDegree(V,T,Deg,I).

findMinDegree([V|T],E,Imin):-findDegree(V,E,MinDeg),findMinDegree(T,E,MinDeg,Imin,1,2).
findMinDegree([],_,_,Imin,Imin,_):-!.
findMinDegree([V|T],E,MinDeg,Imin,Ind,Cur):-findDegree(V,E,D),MinDeg>D,Cur1 is Cur+1,findMinDegree(T,E,D,Imin,Cur,Cur1),!.
findMinDegree([V|T],E,MinDeg,Imin,Ind,Cur):-Cur1 is Cur+1,findMinDegree(T,E,MinDeg,Imin,Ind,Cur1).


deleteOneElement(List,El,A):-deleteOneElement(List,El,A,[]).					
deleteOneElement([],_,A,A):-!.
deleteOneElement([El|T],El,A,L):-append(L,T,L1),deleteOneElement([],El,A,L1),!.
deleteOneElement([H|T],El,A,L):-append(L,[H],L1),deleteOneElement(T,El,A,L1).


el_no(A,I,X):-el_no(A,I,1,X).
el_no([H|_],I,I,H):-!.
el_no([_|T],I,K,X):-K1 is K+1,el_no(T,I,K1,X).


parosoch:-get_graph_edges(V,E),parosoch(V,E,Par),nl,write_list_str(Par).

parosoch(V,E,Par):-parosoch(V,E,Par,Cur).
parosoch([],_,Par,Par):-!.
parosoch([V1|T],E,Par,Cur):-adjacent(V1,T,E,Sm),findMinDegree(Sm,E,Imin),el_no(Sm,Imin,V2),
							append(Cur,[[V1,V2]],Cur1),deleteOneElement(T,V2,SurviveVertexeses),
							parosoch(SurviveVertexeses,E,Par,Cur1),!.
parosoch([V1|T],E,Par,Cur):-parosoch(T,E,Par,Cur),!.

get_cover([V|T],Edges,Vertexes,EdgeCover,CurCover):-neighbors(V,Vertexes,Edges,Neigh,[]),
				all_degrees(Neigh,Edges,Degrees,[]),min_in_list(Degrees,Ind),el_no(Neigh,Ind,V1),append(CurCover,[[V,V1]],NewCover),
				delete_el(T,V1,UsingVertexes,[]),get_cover(UsingVertexes,Edges,Vertexes,EdgeCover,NewCover).
				
				
				

