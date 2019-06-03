ancestor(A, B) :- parent(A, B).
ancestor(A, B) :- parent(X, B), ancestor(A, X).

lca(A, B) :- A == B -> write(A);
			ancestor(A, B) -> write(A);
			parent(X, A), lca(X, B).
	
loop(0).
loop(N) :- N > 0, read(P), read(C), nl, assert(parent(P, C)), M is N - 1, loop(M).

new_loop(0).
new_loop(N) :- N > 0, read(P), read(C), nl, lca(P, C), write('\n'), M is N - 1, new_loop(M).

main :- read(N), loop(N - 1), read(M), new_loop(M), halt.

:- initialization(main).