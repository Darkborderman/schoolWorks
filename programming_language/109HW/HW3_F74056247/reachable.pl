/*walk through edges*/
walk(X, Y, _) :- edge(X,Y).
walk(X, Y, L) :- not(member(X, L)), edge(X, Z), walk(Z, Y, [X|L]).

/*kepp walking, use semicolon when return false
  it will execute the latter result*/
reachable :- read(R1), read(R2),
  walk(R1, R2, []), write('Yes');
  write('No').

setEdge :- read(E1), read(E2), assert(edge(E1, E2)), assert(edge(E2, E1)).

fact(N) :- N > 0, N1 is N-1, setEdge, fact(N1).
fact(0).
query(Q) :- Q > 0, Q1 is Q-1, reachable, query(Q1).
query(0).

main :- read(W), read(N), fact(N), read(Q), query(Q), halt.

:- initialization(main).