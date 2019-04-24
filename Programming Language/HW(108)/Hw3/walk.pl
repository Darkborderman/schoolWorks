path(X,Y) :-
	findall(A-B, edge(A,B), Es),
    vertices_edges_to_ugraph([],Es,G),
    reachable(X,G,Path),
    member(Y,Path).

connected(A, B) :- assert(edge(A, B)), assert(edge(B, A)).

edge(a,e).
edge(e,a).

edge(e,d).
edge(d,e).

edge(d,c).
edge(c,d).

edge(c,b).
edge(b,c).

edge(b,a).
edge(a,b).

edge(d,a).
edge(a,d).

edge(e,c).
edge(c,e).

edge(f,b).
edge(b,f).