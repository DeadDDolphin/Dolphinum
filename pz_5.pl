pr5_1:-read_str(A,N),write_str(A),write(', '),write_str(A),write(', '),
	write_str(A),write(', '),write(N).

pr5_2:-read_str(A,N),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).
count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
					I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]):-!.
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

pr5_3:-	read_str(A,N),get_words(A,Words),uniq_el(Words,Unique_words),
		counts_in_list(Unique_words,Words,Counts),max_in_list(Counts,Ind),
		el_no(Unique_words,Ind,Freq_word),write_str(Freq_word).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

get_words(A,Words):-get_words(A,[],Words).
get_words([],B,B):-!.
get_words(A,Temp_words,B):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	append(Temp_words,[Word],T_w),get_words(A2,T_w,B),!.
get_words(_,B,B).

uniq_el(Ref,Res):-uniq_el(Ref,Res,[]).
uniq_el([],Res,Res):-!.
uniq_el([H|T],Res,Cur):-check(H,Cur,Cur,R), uniq_el(T,Res,R).
check(El,[El|_],Ref,Ref):-!.
check(El,[],Ref,R):-append(Ref,[El],R),!.
check(El,[_|T],Ref,R):-check(El,T,Ref,R).

count_in_list(_,[],0):-!.
count_in_list(EL,[EL|Tail],K):-count_in_list(EL,Tail,K1), K is K1+1,!.
count_in_list(El,[_|Tail],K):-count_in_list(El,Tail,K).

counts_in_list([],_,[]):-!.
counts_in_list([El|T_El],List,[Count|T_Count]):-
		count_in_list(El,List,Count),counts_in_list(T_El,List,T_Count).

max_in_list([H|T],Imax):-max_in_list(T,H,1,2,Imax).
max_in_list([],_,Cur,_,Cur):-!.
max_in_list([H|T],Max,Cur,Ind,Imax):-H>Max,Ind1 is Ind+1,max_in_list(T,H,Ind,Ind1,Imax),!.
max_in_list([_|T],Max,Cur,Ind,Imax):-Ind1 is Ind+1,max_in_list(T,Max,Cur,Ind1,Imax).

el_no(A,I,X):-el_no(A,I,1,X).
el_no([H|_],I,I,H):-!.
el_no([_|T],I,K,X):-K1 is K+1,el_no(T,I,K1,X).

read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
	read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
	r_l_s(List,List_len,C_l,C_l_l,Flag).

max([H|T], M):-max(T, M, H).
max([], M, M):-!.
max([H|T], M, MI):-H > MI, !, max(T, M, H).
max([_|T], M, MI):-max(T,M, MI).

pr5_6:-see('C:/Users/Dima/Documents/Prolog/file.txt'),read_list_str(List,List_len),seen,max(List_len,X),write(X).
