in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

stronger(A,B,[C]):-fail.
stronger(A,B,[A|[B|Tail]]).
stronger(A,B,[_|List]):-stronger(A,B,List).

moreStronger(A,B,[C]):-fail.
moreStronger(A,B,[A|[_,B|Tail]]).
moreStronger(A,B,[A|[_,_,B|Tail]]).
moreStronger(A,B,[_|List]):-moreStronger(A,B,List).


weaker(A,B,[C]):-fail.
weaker(A,B,[B|[A|Tail]]).
weaker(A,B,[_|List]):-weaker(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

zadacha:- Boxers=[_,_,_,_],Box1 = [thomas,herbert],Box2 = [herbert,frensis],Box3 = [frensis,jeims],Box4 = [jeims,thomas],
		(stronger([_,frensis],[thomas,_],Boxers) or stronger[frensis,_],[_,thomas],Boxers) or stronger([frensis,_],[thomas,_],Boxers) or
		stronger([_,frensis],[_,thomas],Boxers)),
		(stronger([_,frensis],[herbert,_],Boxers) or stronger[frensis,_],[_,herbert],Boxers) or stronger([frensis,_],[herbert,_],Boxers) or
		stronger([_,frensis],[_,herbert],Boxers)),
		(stronger([_,herbert],[frensis,_],Boxers) or stronger[herbert,_],[_,frensis],Boxers) or stronger([herbert,_],[frensis,_],Boxers) or
		stronger([_,herbert],[_,frensis],Boxers)),
		(stronger([_,jeims],[herbert,_],Boxers) or stronger[jeims,_],[_,herbert],Boxers) or stronger([jeims,_],[herbert,_],Boxers) or
		stronger([_,jeims],[_,herbert],Boxers)),
		(moreStronger([_,herbert],[frensis,_],Boxers) or moreStronger[herbert,_],[_,frensis],Boxers) or moreStronger([herbert,_],[frensis,_],Boxers) or
		moreStronger([_,herbert],[_,frensis],Boxers)),
		in_list(Boxers,Box1),in_list(Boxers,Box2),in_list(Boxers,Box3),in_list(Boxers,Box4).
		write(Houses).