% filename: hanoi.pl

move(1, X, Y, _) :-
	write('Move top disk from '), write(X), write('to '), write(Y), nl.
	
move(N, X, Y, Z) :- 
	N > 1,M is N - 1, move(M,X,Z,Y), move(1,X,Y,_), move(M,Z,Y,X).
	
main :- 
	move(3,left,right,center), halt.
	
 :- initialization(main).