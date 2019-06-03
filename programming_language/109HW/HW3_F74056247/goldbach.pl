/*Prime definition, integer>3 can't be divided by smaller number*/
isPrime(2).
isPrime(3).
isPrime(P) :- integer(P), P > 3, P mod 2 =\= 0, not(haveFactor(P,3)).  

/*Divided definition, test if it can be divided or not*/
haveFactor(N,L) :- N mod L =:= 0.
haveFactor(N,L) :- L * L < N, L2 is L + 1, haveFactor(N,L2).

goldbach(4,[2,2]) :- write([2,2]).
goldbach(N, L) :- N mod 2 =:= 0, N > 4, nextPair(N,3).
goldbach(N,[P,Q],P) :- P < N, Q is N - P, isPrime(Q), write([P,Q]),write('\n').

/*keep finding till equal or larger then input*/
nextPair(N,P) :- P >= N, nl.
nextPair(N,P) :- P < N, goldbach(N,L,P), nextPrime(P,P1), nextPair(N,P1).

/*finding next prime*/
nextPrime(P,P1) :- P1 is P + 2, isPrime(P1).
nextPrime(P,P1) :- P2 is P + 2, nextPrime(P2,P1).

main :- write('Input: '), read(N), goldbach(N, L), halt.

:- initialization(main).