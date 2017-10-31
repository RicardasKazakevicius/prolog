% Ričardas Kazakevičius
% 4 kursas 1 grupė
% 2.6 ir 5.2 užduotys

% 5.2 Apibrėžkite predikatą realizuojantį nurodytą sveikaskaitę operaciją naudojant tik sudėties ir atimties operacijas: dalyba div

% divNegative skirtas kai pirmas skaičius neigiamas, o antras teigiamas
% divPositive skirtas kai abu skaičiai yra teigiami

% Užklausų pavyzdžiai: 
% div(3,2,X). div(-5,2). div(10,-3,X).

div(_, 0, _):-
	write("Dalyba is 0 negalima").

div(0, _, 0).

div(Num1, Num2, Res):-
	( Num1 < 0,
	  Num2 < 0,
	  Num11 = Num1 * (-1),
	  Num22 = Num2 * (-1),
	  (
	    (
	      Num11 < Num22,
              Res is 0
	    );
	    divPositive(Num11, Num22, Res)
	  )
	);
	(
	  Num1 < 0,
	  divNegative(Num1, Num2, Res)
	);
	(
		Num2 < 0,
		Num11 = Num1 * (-1),
		Num22 = Num2 * (-1),
		divNegative(Num11, Num22, Res)
	);
	(
		(
		  Num1 < Num2,
		  Res is 0
		);
		divPositive(Num1, Num2, Res)
	).

divNegative(Num1, Num2, Res) :- 
        Num is Num1 + Num2,
        (
		  (
		    Num >= Num2,
		    ResNew is 1
		  )
		  ; 
		  (
		    divNegative(Num, Num2, ResNew)
		  )
        ),
        Res is ResNew - 1.

divPositive(Num1, Num2, Res) :- 
        Num is Num1 - Num2,
        (
		  (
		    Num < Num2,
		    ResNew is 0
		  )
		  ; 
		  (
		    divPositive(Num, Num2, ResNew)
		  )
        ),
        Res is ResNew + 1.


%2.6 „studentas A yra jaunesnis už aukštesnio kurso studentą B“.

% Užklausų pavyzdžiai: 
% jaunesnisUzAukstesni(azuolas, X). jaunesnisUzAukstesni(ricardas, greta).

studentas(ricardas,1). 
studentas(azuolas,2). 
studentas(laura,4). 
studentas(evaldas,3). 
studentas(rokas,3). 
studentas(rimas,1). 
studentas(greta,2). 

yraVyresnis(greta,rimas).
yraVyresnis(rimas,rokas).
yraVyresnis(rokas,evaldas).
yraVyresnis(evaldas,laura).
yraVyresnis(laura,azuolas).
yraVyresnis(azuolas,ricardas).

yraJaunesnis(Stud1, Stud2):-
	yraVyresnis(Stud2, Stud1).

yraJaunesnis(Stud1, Stud2):-
	yraVyresnis(X, Stud1),
	yraJaunesnis(X, Stud2).

jaunesnisUzAukstesni(Stud1, Stud2):- 
	yraJaunesnis(Stud1, Stud2),

	studentas(Stud1, Stud1Kursas),
	studentas(Stud2, Stud2Kursas),
	Stud1Kursas < Stud2Kursas.












kart([Elem|Tail], K, Answer):-
	kart1([Elem|Tail], K, 1, Answer).
	

kart1([Elem1|[Elem2|_]], K, Count, Answer):-
	K == Count,
	Elem1 \= Elem2,
	Answer = Elem1.


kart1([Elem], K, Count, Answer):-
	K == Count,
	Answer = Elem.


kart1([Elem1|[Elem2|Tail]], K, Count, Answer):- 
	Elem1 == Elem2,
	C is Count + 1,
	kart1([Elem2|Tail], K, C, Answer).
		

kart1([Elem1|[Elem2|Tail]], K, _, Answer):-
	Elem1 \= Elem2,
	kart1([Elem2|Tail], K, 1, Answer).
	




