% Ričardas Kazakevičius
% 4 kursas 1 grupė
% 1.1; 2.5; 3.3; 4.1 užduotys

% 1.1 uzd
% Užklausų pavyzdžiai:
% did([4,18,23,100]).
% did([1,1,3,5]).
% did([4,0,5,10]).

did([_]).

did([Num1 | [Num2|Tail]]):-
	Num1 < Num2,
	did([Num2|Tail]).


% 2.5
% Užklausų pavyzdžiai:
% knelyg([1,8,3,7,5,2],K). knelyg([1,1,3,7,5,9],K). 
% knelyg([],K). knelyg([1],K). knelyg([2,8,6],K).

knelyg([], 0).

knelyg([Num|Tail], K):-
	Remainder is mod(Num, 2),
	knelyg(Tail, NewK),
	K is NewK + Remainder.

% 3.3
% Užklausų pavyzdžiai:
% skirk_teig_neig([1,4,-2,3,0],R1,R2). skirk_teig_neig([],R1,R2).


skirk_teig_neig([], [], []).

skirk_teig_neig([Elem|Tail], [Elem|R1], R2):-
	Elem > 0, !,
	skirk_teig_neig(Tail, R1, R2).

skirk_teig_neig([Elem|Tail], R1, [Elem|R2]):-
	Elem < 0, !,
	skirk_teig_neig(Tail, R1, R2).

skirk_teig_neig([_|Tail], R1, R2):-
	skirk_teig_neig(Tail, R1, R2).



% 4.1
% ---------
% kart1 turi papildomą kintamaji, kuriame skaičiuojama, kiek kartų iš eilės eina tas pats simbolis,
% ---------
% Užklausų pavyzdžiai:
% kart([a,a,c,a,b,b,b,b,a,g],4,E). % kart([a,a,a,a,b,t,a],4,E).
% kart([a,a,a,a],4,E). kart([b,a,a,a,a],4,E). kart([a,a,a,a,b,z],4,E).
% kart([a,a,a,a,b,t,a],1,E). % kart([a,a,a,a,b,t,a,t,t,a],2,E).
% kart([a,a,a,b,b],2,E). kart([a,a,c,a,b,b,b,b,a,g],4,E).


kart([Elem|Tail], K, Answer):-
	kart1([Elem|Tail], K, 1, Answer).
	

kart1([Elem1|[Elem2|_]], K, K, Elem1):-
	Elem1 \= Elem2.

kart1([Elem], K, K, Elem).

kart1([Elem1|[Elem1|Tail]], K, Count, Answer):- 
	C is Count + 1,
	kart1([Elem1|Tail], K, C, Answer).

kart1([Elem1|[Elem2|Tail]], K, _, Answer):-
	Elem1 \= Elem2,
	kart1([Elem2|Tail], K, 1, Answer).
	




