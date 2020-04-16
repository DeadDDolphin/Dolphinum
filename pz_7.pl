build_all_razm_p:-
		read_str(A,N),read(K),b_a_rp(A,K,[]).

b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

build_all_perm:-
		read_str(A,N),b_a_p(A,[]).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_p([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p(A,Perm):-in_list_exlude(A,El,A1),b_a_p(A1,[El|Perm]).

build_all_razm:-
		read_str(A,N),read(K),b_a_r(A,K,[]).

b_a_r(_,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,K,Perm):-in_list_exlude(A,El,A1),K1 is K-1,b_a_r(A1,K1,[El|Perm]).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

pr_subset:-read_str(A,N),sub_set(B,A),write_str(B),nl,fail.

sub_set_k([],[],0).
sub_set_k([H|Sub_set],[H|Set],K):- K1 is K-1,sub_set_k(Sub_set,Set,K1).
sub_set_k(Sub_set,[H|Set],K):-sub_set_k(Sub_set,Set,K).
sochet:-read_str(A,N),read(K),sub_set_k(B,A,K),write_str(B),nl,fail.

sub_set_p([],[],0).
sub_set_p([H|Sub_set],[H|Set],K):- K1 is K-1,sub_set_p(Sub_set,Set,K1).
sub_set_p(Sub_set,[H|Set],K):-sub_set_p(Sub_set,Set,K).
sochet_pov:-read_str(A,N),read(K),sub_set_p(B,A,K),write_str(B),nl,fail.
