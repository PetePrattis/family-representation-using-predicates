/**----------------------------------------------------------------------------------------
1η προαιρετική εργασία 
Να αναπαρασταθεί η παραπάνω οικογένεια καθώς και 3-4 οικογένειες ακόμη (δική σας επιλογής) 
χρησιμοποιώντας το κατηγόρημα family-3 και κατάλληλους σύνθετους όρους. 
Ορίστε τα κατηγορήματα exists-1, dateofbirth-2 και salary-2 και χρησιμοποιήστε τα για να ανακτήσετε 
όλους τους γονείς που γεννήθηκαν πριν το 1950 και ο μισθός τους είναι μικρότερος από 8000. 
-----------------------------------------------------------------------------------------*/

% Παναγιώτης Πράττης Π15120

/* ορίζω τα κατηγορήματα family για τις 4 οικογένεις με 3 arguments
το 1ο argument έχει τον πατέρα, το 2ο την μητέρα και το 3ό μια λίστα με τα παιδιά
για την εργασία μου δεν έχει χρησμότητα αυτό το predicate
 */
family(person(tom_fox), person(ann_fox), person([pat_fox, jim_fox])).
family(person(thomas_wayne), person(martha_wayne), person([bruce_wayne])).
family(person(theo_pratt), person(jenny_pratt), person([pete_pratt, stevi_pratt, deppy_pratt])).
family(person(robert_kardashian), person(kris_kardashian), person([kourtney_kardashian, kim_kardashian, khloe_kardashian])).

/* ορίζω τα κατηγορήματα dateofbirth με 2 arguments 
το 1ο argument είναι το ονοματεπώνυμο του μέλους της οικογένεις και το 2ο η πλήρης ημερομηνία γέννησης
με αυτό το predicate θα βρω τους υποψήφιους γονείς οι οποίοι είναι γεννημένοι πριν το 1950
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

/* ορίζω τα κατηγορήματα salary με 2 arguments 
το 1ο argument είναι το ονοματεπώνυμο του μέλους της οικογένεις και το 2ο περιέχει την εργασία και τον μισθό
με αυτό το predicate θα βρω τους υποψήφιους γονείς οι οποίοι είναι εργαζόμενοι με μισθό μικρότερο απο 8000
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

/* ορίζω τα κατηγορήματα parent με 2 arguments
το 1ο argument είναι το ονοματεπώνυμο του γονέα της οικογένεις και το 2ο περιέχει τα ονοματεπώνυμα των παιδιών
με αυτό το predicate θα βρω ποιά από τα persons είναι γονείς
*/
parent(tom_fox,(pat_fox, jim_fox)).
parent(ann_fox,(pat_fox, jim_fox)).

parent(thomas_wayne,bruce_wayne).
parent(martha_wayne,bruce_wayne).

parent(theo_pratt,(pete_pratt, stevi_pratt, deppy_pratt)).
parent(jenny_pratt,(pete_pratt, stevi_pratt, deppy_pratt)).

parent(robert_kardashian,(kourtney_kardashian, kim_kardashian, khloe_kardashian)).
parent(kris_kardashian,(kourtney_kardashian, kim_kardashian, khloe_kardashian)).

/* τυπώνω οδηγίες με την εκτέλεση*/
:- format('recover all parents born before 1950 and their salary is less than 8,000 ~n'),
 format('type "exists(X)." to get the answer ~n').

exists(X) :- /*το κατηγόρημα exists θα είναι*/
 parent(X , _), dateofbirth(X, date(_, _, T)), /*ένας γονέας, του οποίου η χρονολογία γέννησης*/
 T =< 1950,	/*είναι μικρότερη απο το 1950*/
 salary(X, works(_, M)), /*και ο μισθός του*/
 M \= 0, M =< 8000,	/*δεν είναι 0 (δηλαδή άνεργος) και έιναι μικρότερος ή ίσος με 8000*/
 format('~w born in ~w has salary of ~3f euros ~n', [X, T, M]).	/*και τελικά τυπώνω με format το αποτέλεσμα*/
 
candidates(X) :- /* αυτό το κατηγόρημα εμφανίζει όλους τους γονείς ημερομηνία γέννησης και τον μισθό τους */
 parent(X, _), dateofbirth(X, date(_, _, T)), salary(X, works(_, M)),
 format('~w born in ~w is a possible candidate for this project and has salary of ~3f euros ~n', [X, T, M]).

 








