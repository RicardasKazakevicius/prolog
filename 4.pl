% Ričardas Kazakevičius
% 4 kursas 1 grupė
% 13. Sudėlioti ženklus
% Užklausų pavyzdžiai: 
% sudetiZenklus([1,2,2], 1). sudetiZenklus([1,2,2], 0).
% sudetiZenklus([12,3,45,67,8,9], 4). sudetiZenklus([1,1,2,20,20], 2).


sudetiZenklus(List, Number):-
	find(List, Number, Signs),
	writeAswer(List, Signs, Number).


find([H|T], Number, Signs):- 
	sign(T, H, Number, Signs).


sign([H|T], Head, Number, Signs):- 
   Num is Head + H,
   sign(T, Num, Number, Signs1),!,
   Signs = ["+"|Signs1].

sign([H|T], Head, Number, Signs):- 
   Num is Head - H,
   sign(T, Num, Number, Signs1),!,
   Signs = ["-"|Signs1].

sign([], Number, Number, ["="]).


writeAswer([H|T], [SignH|SignT], Number):-
	write(H),
	write(" "),
	write(SignH),
	write(" "),
	writeAswer(T, SignT, Number).

writeAswer([], _, Number):-
	write(Number).