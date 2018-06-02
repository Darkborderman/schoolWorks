%two prime sum
%to find the prime sum
two_prime_sum(4,[2,2]) :- write('2 2') , !.
two_prime_sum(N,L) :-  N > 4 , N mod 2 =:= 0 , two_prime_sum(N,L,3).

two_prime_sum(N,[P,Q],P) :- Q is N - P , is_prime(Q) , write(P) , write(' ') , write(Q), !.
two_prime_sum(N,L,P) :- P < N , next_prime(P,P1),two_prime_sum(N,L,P1).

next_prime(P,P1) :- P1 is P + 2 , is_prime(P1) , !;
					P2 is P + 2 , next_prime(P2,P1).


% judge if the prime
is_prime(2).
is_prime(3).
is_prime(T) :- T > 3 , T mod 2 =\= 0 , \+odd_factor(T,3).

odd_factor(Num,Temp) :- Num mod Temp =:= 0;
						Temp * Temp < Num , Temp1 is Temp + 2 , odd_factor(Num,Temp1).

main :- 
		read(List),
		two_prime_sum(List,_),halt.	

:- initialization(main).
		
		
						