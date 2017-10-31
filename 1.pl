asmuo(vygantas, vvyras, 75, delfi).
asmuo(zinaida, moteris, 72, kepsnys).

asmuo(stefanija, moteris, 71, geles).
asmuo(stasys, vyras, 72, namai).

asmuo(nomeda, moteris, 50, darzoves).
asmuo(jonas, vyras, 49, darzoves).
asmuo(ricardas, vyras, 22, informatika).
asmuo(martyna, moteris, 26, vanduo).
asmuo(ugne, moteris, 15, informatika).

asmuo(arnas, vyras, 53, dviraciai).
asmuo(gaiva, moteris, 51, dviraciai).
asmuo(tomas, vyras, 30, informatika).
asmuo(marius, vyras, 25, telefonas).

asmuo(arvydas, vyras, 53, sodas).
asmuo(laura, moteris, 21, indormatika).
asmuo(agne, moteris, 50, akiniai).

mama(agne, laura).
mama(stefanija, jonas).
mama(stefanija, arvydas).

mama(zinaida, nomeda).
mama(zinaida, gaiva).

mama(nomeda, ricardas).
mama(nomeda, martyna).
mama(nomeda, ugne).

mama(gaiva, tomas).
mama(gaiva, marius).
	
pora(arvydas, agne).
pora(stasys, stefanija).
pora(jonas, nomeda).
pora(arnas, gaiva).
pora(vygantas, zinaida).


%24
pusbrolis(Pusbrolis, PusbrolisPussesere):-
	asmuo(Pusbrolis, vyras, _, _),
	mama(Mama1, Pusbrolis),
	mama(Mama2, PusbrolisPussesere),
	
	mama(Mama, Mama1),
	mama(Mama, Mama2),
	
	Mama1 \= Mama2.
	

pusbrolis(Pusbrolis, PusbrolisPussesere):-
	asmuo(Pusbrolis, vyras, _, _),

	pora(Tevas1, Mama1), 
	mama(Mama1, Pusbrolis),

	pora(Tevas2, Mama2), 
	mama(Mama2, PusbrolisPussesere),
	
	mama(Mama, Tevas1),
	mama(Mama, Tevas2),
	Tevas1 \= Tevas2.


pusbrolis(Pusbrolis, PusbrolisPussesere):-
	asmuo(Pusbrolis, vyras, _, _),

	pora(Tevas, Mama1),
	mama(Mama1, Pusbrolis),

	mama(Mama, PusbrolisPussesere),

	mama(Mama2, Mama),
	mama(Mama2, Tevas),

	Mama1 \= Mama.


pusbrolis(Pusbrolis, PusbrolisPussesere):-
	asmuo(Pusbrolis, vyras, _, _),

	pora(Tevas, Mama1),
	mama(Mama1, PusbrolisPussesere),

	mama(Mama, Pusbrolis),

	mama(Mama2, Mama),
	mama(Mama2, Tevas),

	Mama1 \= Mama.

%27		
vedes(Vyras):-
	pora(Vyras, _).
	%asmuo(Vyras, vyras, _, _).


%31
% 25-35metai
vps(Vyras):-
	asmuo(Vyras, vyras, Metai, _),
	Metai >= 25,
	Metai =< 35.

%38
stos_i_informatika(Abiturientas):-
	asmuo(Abiturientas, _, Metai, informatika),
	Metai >= 16,
	Metai =< 25.	














broliai(Brolis1, Brolis2):-
	mama(Mama, Brolis1),
	mama(Mama, Brolis2),
	Brolis1 \= Brolis2,
	asmuo(Brolis1, vyras, _, _),
	asmuo(Brolis2, vyras, _, _).


seserys(Sese1, Sese2):-
	mama(Mama, Sese1),
	mama(Mama, Sese2),
	Sese1 \= Sese2,
	asmuo(Sese1, moteris, _, _),
	asmuo(Sese2, moteris, _, _).


tevas(Tevas, Vaikas):- 
	 pora(Tevas, Mama), 
	mama(Mama, Vaikas).	

nusisekusi_pora(Zmogus1, Zmogus2):- 
      ( pora(Zmogus1, Zmogus2);
	pora(Zmogus2, Zmogus1) ),
	asmuo(Zmogus1, _, Metai1, Pomegis),
	asmuo(Zmogus2, _, Metai2, Pomegis),
	MetaisDaugiau is Metai1+1,
	MetaisMaziau is Metai1-1,
      (	Metai1 == Metai2;
	MetaisDaugiau == Metai2;
	MetaisMaziau == Metai2).	


at_dat(Zmogus, Jubiliejai):-
	asmuo(Zmogus, _, Amzius, _), 
	Metai is Jubiliejai*10,
	MetaiPlius10 is Jubiliejai*10 + 10,
	Amzius >= Metai,
	Amzius < MetaiPlius10.
	







