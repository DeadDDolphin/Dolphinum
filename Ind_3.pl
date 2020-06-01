read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
	read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
	r_l_s(List,List_len,C_l,C_l_l,Flag).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).
write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

vowelLetter(65).
vowelLetter(69).
vowelLetter(73).
vowelLetter(79).
vowelLetter(85).
vowelLetter(89).
vowelLetter(97).
vowelLetter(101).
vowelLetter(105).
vowelLetter(111).
vowelLetter(117).
vowelLetter(121).
consonantsInStr(Str,N):-consonantsInStr(Str,N,0).
consonantsInStr([],N,N):-!.
consonantsInStr([H|T],N,I):-not(vowelLetter(H)),I1 is I+1,consonantsInStr(T,N,I1).
consonantsInStr([H|T],N,I):-consonantsInStr(T,N,I),!.

consonantsList(List,Cons):-consonantsList(List,Cons,[]).
consonantsList([],Cons,Cons):-!.
consonantsList([H|T],Cons,A):-consonantsInStr(H,N),append(A,[N],A1),consonantsList(T,Cons,A1),!.


el_no(A,I,X):-el_no(A,I,1,X).
el_no([H|_],I,I,H):-!.
el_no([_|T],I,K,X):-K1 is K+1,el_no(T,I,K1,X).

deleteAll(List,El,NewList):-deleteAll(List,El,NewList,[]).
deleteAll([],_,NewList,NewList):-!.
deleteAll([El|T],El,NewList,L):-deleteAll(T,El,NewList,L),!.
deleteAll([H|T],El,NewList,L):-append(L,[H],L1),deleteAll(T,El,NewList,L1).


numbersOfEl(List,El,Numbers):-numbersOfEl(List,El,1,Numbers,[]).
numbersOfEl([],_,_,Numbers,Numbers):-!.
numbersOfEl([El|T],El,I,Numbers,N):-append(N,[I],N1),I1 is I+1,numbersOfEl(T,El,I1,Numbers,N1),!.
numbersOfEl([H|T],El,I,Numbers,N):-I1 is I+1,numbersOfEl(T,El,I1,Numbers,N),!.

numbersOfList(List,Cons,Numbers):-numbersOfList(List,Cons,Numbers,[]).
numbersOfList([],_,Numbers,Numbers):-!.
numbersOfList([H|T],Cons,Numbers,N):-numbersOfEl(Cons,H,A),deleteAll(T,H,NewList),append(N,A,N1),numbersOfList(NewList,Cons,Numbers,N1),!.


deleteEl(List,El,NewList):-deleteEl(List,El,NewList,[]).
deleteEl([El|T],El,NewList,L):-append(L,T,NewList),!.
deleteEl([H|T],El,NewList,L):-append(L,[H],L1),deleteEl(T,El,NewList,L1).

selection_sort(List, SortedList):-  selection_sort(List, [], SortedList).  
selection_sort([], SortedList, SortedList):-!.
selection_sort(UnSortedPart, SortedPart, SortedList):-min_list(UnSortedPart, MinElement),deleteEl(UnSortedPart, MinElement, UnSortedTail),
  selection_sort(UnSortedTail, [MinElement|SortedPart], SortedList).
  
  
sortStr(List,Numbers,Strings):-sortStr(List,Numbers,Strings,[]).
sortStr(_,[],Strings,Strings):-!.
sortStr(List,[Num|Tail],Strings,A):-el_no(List,Num,CurrentStr),append(A,[CurrentStr],A1),sortStr(List,Tail,Strings,A1).

zadacha:-see('C:/Users/Dima/Documents/GitHub/Dolphinum/Ind3File.txt'),read_list_str(List,List_len),seen,
		consonantsList(List,Cons),selection_sort(Cons, SortCons),numbersOfList(SortCons,Cons,Numbers), sortStr(List, Numbers, Strings),
		tell('C:/Users/Dima/Documents/GitHub/Dolphinum/Ind3Result.txt'),write_list_str(Strings),told.
		
		
		
		
		