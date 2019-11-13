% Παναγιώτης Πράττης / Panagiotis Prattis

/* 
set family predicates for 4 families with 3 arguments 1st argument has father, 
2nd argument and 3rd list of kids for my work has no use for this predicate
*/
 
family(person(tom_fox), person(ann_fox), person([pat_fox, jim_fox])).
family(person(thomas_wayne), person(martha_wayne), person([bruce_wayne])).
family(person(theo_pratt), person(jenny_pratt), person([pete_pratt, stevi_pratt, deppy_pratt])).
family(person(robert_kardashian), person(kris_kardashian), person([kourtney_kardashian, kim_kardashian, khloe_kardashian])).

/* 
set arguments dateofbirth with 2 arguments 1st argument is the name of the family member and 2nd
full date of birth with this predicate i will find candidate parents who were born before 1950
*/
dateofbirth(tom_fox,date(7,may,1950)).
dateofbirth(ann_fox,date(9,may,1951)).
dateofbirth(pat_fox,date(5,may,1973)).
dateofbirth(jim_fox,date(5,may,1973)).

dateofbirth(thomas_wayne,date(10,june,1942)).
dateofbirth(martha_wayne,date(21,december,1946)).
dateofbirth(bruce_wayne,date(1,april,1970)).

dateofbirth(theo_pratt,date(4,july,1949)).
dateofbirth(jenny_pratt,date(19,november,1955)).
dateofbirth(pete_pratt,date(26,may,1987)).
dateofbirth(stevi_pratt,date(1,january,1991)).
dateofbirth(deppy_pratt,date(20,february,1994)).

dateofbirth(robert_kardashian,date(22,february,1944)).
dateofbirth(kris_kardashian,date(5,november,1950)).
dateofbirth(kourtney_kardashian,date(1,january,1975)).
dateofbirth(kim_kardashian,date(2,february,1980)).
dateofbirth(khloe_kardashian,date(3,march,1985)).

/* 
set arguments salary with 2 arguments 1st argument is the family member's name 
and 2nd contains job and salary with this predicate i will find prospective parents 
who are working with salary less than 8000
*/
salary(tom_fox, works(bbc, 15200)).
salary(ann_fox, works(unemployed, 0)).
salary(pat_fox, works(unemployed, 0)).
salary(jim_fox, works(unemployed, 0)).

salary(thomas_wayne, works(wayne_industries, 10000000)).
salary(martha_wayne, works(wayne_industries, 7999)).
salary(bruce_wayne, works(unemployed, 0)).

salary(theo_pratt, works(programmer, 2000)).
salary(jenny_pratt, works(teacher, 1200)).
salary(pete_pratt, works(unemployed, 0)).
salary(stevi_pratt, works(unemployed, 0)).
salary(deppy_pratt, works(unemployed, 0)).

salary(robert_kardashian, works(businessman, 50000)).
salary(kris_kardashian, works(producer, 6500)).
salary(kourtney_kardashian, works(unemployed, 0)).
salary(kim_kardashian, works(unemployed, 0)).
salary(khloe_kardashian, works(unemployed, 0)).

/* 
i define parent predicates with 2 arguments the 1st argument is the name of the parent of the family 
and the 2nd contains the names of the children with this predicate i will find which of the persons are parents
*/
parent(tom_fox,(pat_fox, jim_fox)).
parent(ann_fox,(pat_fox, jim_fox)).

parent(thomas_wayne,bruce_wayne).
parent(martha_wayne,bruce_wayne).

parent(theo_pratt,(pete_pratt, stevi_pratt, deppy_pratt)).
parent(jenny_pratt,(pete_pratt, stevi_pratt, deppy_pratt)).

parent(robert_kardashian,(kourtney_kardashian, kim_kardashian, khloe_kardashian)).
parent(kris_kardashian,(kourtney_kardashian, kim_kardashian, khloe_kardashian)).

/* print instructions with execution*/
:- format('recover all parents born before 1950 and their salary is less than 8,000 ~n'),
 format('type "exists(X)." to get the answer ~n').

exists(X) :- /*the predicate exists will be*/
 parent(X , _), dateofbirth(X, date(_, _, T)), /*a parent whose birth date*/
 T =< 1950,	/*is smaller than 1950*/
 salary(X, works(_, M)), /*and his salary*/
 M \= 0, M =< 8000,	/*is not 0 (unemployed) and is less than or equal to 8000*/
 format('~w born in ~w has salary of ~3f euros ~n', [X, T, M]).	/*and finally I format the result*/
 
candidates(X) :- /* this predicate shows all parents their date of birth and their salary */
 parent(X, _), dateofbirth(X, date(_, _, T)), salary(X, works(_, M)),
 format('~w born in ~w is a possible candidate for this project and has salary of ~3f euros ~n', [X, T, M]).

 
