path(A, B) :- walk(A, B, []).            

walk(A, B, V) :- edge(A,X), not(member(X, V)), (B = X; walk(X, B, [A|V])).

reachable(A, B) :- (call(path(A, B)) -> write('Yes'); write('No')).

loop(0).
loop(N) :- N > 0, read(A), read(B), nl, assert(edge(A, B)), assert(edge(B, A)), M is N - 1, loop(M).

new_loop(0).
new_loop(N) :- N > 0, read(A), read(B), nl, reachable(A, B), write('\n'), M is N - 1, new_loop(M).

main :- read(N), read(E), loop(E), read(M), new_loop(M), halt.

:- initialization(main).