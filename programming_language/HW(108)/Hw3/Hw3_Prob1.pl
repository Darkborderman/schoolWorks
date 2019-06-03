divisible(P, R) :- 0 is P mod R, !.
divisible(P, R) :- P > R + 1, divisible(P, R + 1).

prime(2).
prime(3).
prime(P) :- P < 2, !, false.
prime(P) :- not(divisible(P, 2)).

goldbach(4, [2, 2]).
goldbach(N,L) :- N mod 2 =:= 0, N > 4, goldbach(N, L, 3).

goldbach(N, [P, Q], P) :- Q is N - P, prime(Q), !.
goldbach(N, L, P) :- P < N, prime_n(P, R), goldbach(N, L, R).

prime_n(P, R) :- R is P + 2, prime(R), !.
prime_n(P, R) :- T is P + 2, prime_n(T, R).

main :- 
	write('Input : '), read(N), goldbach(N, L), write('Output : '), write(L), halt.
	
:- initialization(main).
