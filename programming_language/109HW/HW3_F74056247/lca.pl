/*ancestor definition, if b comes from a
 then any connection through a to b its ancestor is a*/
ancestor(A,B) :- parent(A,B). 
ancestor(A,B) :- parent(X,B),ancestor(A,X). 

/*read data then establish fact or output result*/
inputRelation:- read(A),read(B),assert(parent(A,B)).
inputQuery:- read(L1),read(L2),lca(L1,L2).

lca(A,B) :- 
  A==B -> write(A);
  ancestor(A,B) -> write(A);
  parent(X,A),lca(X,B).

/* read data by for loop*/
fact(N):- N>0, N1 is N-1,inputRelation, fact(N1).
fact(0).

query(Q):- Q>0,Q1 is Q-1, inputQuery, query(Q1).
query(0).

main :- read(N), fact(N-1), read(Q), query(Q),halt.

:- initialization(main).