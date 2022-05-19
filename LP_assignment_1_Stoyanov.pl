% DAY 1,
% TASK 1 - Gryffindor table

sits_right_of(seamus, colin).
sits_right_of(colin, harry).
sits_right_of(harry, hermione).
sits_right_of(hermione, ron).
sits_right_of(ron, natalie).
sits_right_of(natalie, kathie).
sits_right_of(kathie, parvati).
sits_right_of(parvati, lavender).
sits_right_of(lavender, neville).
sits_right_of(neville, alicia).
sits_right_of(alicia, fred).
sits_right_of(fred, george).
sits_right_of(george, lee).
sits_right_of(lee, dennis).
sits_right_of(dennis, dean).
sits_right_of(dean, ginny).
sits_right_of(ginny, angelina).
sits_right_of(angelina, seamus).

sits_left_of(X, Y) :- sits_right_of(Y, X).
are_neighbors_of(X, Y, Z) :- sits_left_of(X, Z), sits_right_of(Y, Z).
next_to_each_other(X, Y) :- sits_left_of(X, Y).
next_to_each_other(X, Y) :- sits_right_of(X, Y).

% Is Hermione to the right of Harry?
% ?- sits_right_of(hermione, harry).
% false.

% Is Harry to the right of Ginny?
% ?- sits_right_of(harry, ginny).
% false.

% Who is to the right of Harry?
% ?- sits_right_of(X, harry).
% X = colin.

% Who is sitting at the table?
% ?- sits_right_of(X, Y).
% X = seamus,
% Y = colin ;
% X = colin,
% Y = harry ;
% X = harry,
% Y = hermione ;
% X = hermione,
% Y = ron ;
% X = ron,
% Y = natalie ;
% X = natalie,
% Y = kathie ;
% X = kathie,
% Y = parvati ;
% X = parvati,
% Y = lavender ;
% X = lavender,
% Y = neville ;
% X = neville,
% Y = alicia ;
% X = alicia
% Y = fred ;
% X = fred,
% Y = george ;
% X = george,
% Y = lee ;
% X = lee,
% Y = dennis ;
% X = dennis,
% Y = dean ;
% X = dean
% Y = ginny ;
% X = ginny,
% Y = angelina ;
% X = angelina,
% Y = seamus.

% Who is sitting two seats to the right of Neville?
% ?- sits_right_of(X, neville).
% X = lavender.
% ?- sits_right_of(X, lavender).
% X = parvati.

% Who is sitting between Neville and Parvati?
% ?- are_neighbors_of(neville, parvati, X).
% X = lavender.


%TASK 2 - Harry's family relationships

male(paul).
male(albert).
male(james).
male(harry).
male(vernon).
male(dudley).
male(greatGrandfather).

female(ruth).
female(helen).
female(lili).
female(petunia).
female(greatGrandmother).

parent_of(albert, james).
parent_of(ruth, james).
parent_of(paul, lili).
parent_of(helen, lili).
parent_of(paul, petunia).
parent_of(helen, petunia).
parent_of(james, harry).
parent_of(lili, harry).
parent_of(petunia, dudley).
parent_of(vernon, dudley).
parent_of(greatGrandfather, albert).
parent_of(greatGranmother, albert).

father_of(Father, Child) :- male(Father), parent_of(Father, Child).
mother_of(Mother, Child) :- female(Mother), parent_of(Mother, Child).

grandfather_of(Grandfather, Child) :- parent_of(Parent, Child), father_of(Grandfather, Parent).
grandmother_of(Grandmother, Child) :- parent_of(Parent, Child), mother_of(Grandmother, Parent).

sister_of(Sister, Person) :- parent_of(Parent, Person), parent_of(Parent, Sister), female(Sister), Sister \= Person.

aunt_of(Aunt, Person) :- parent_of(Parent, Person), sister_of(Aunt, Parent).
uncle_of(Uncle, Person) :- aunt_of(Aunt, Person), mother_of(Aunt, Other), father_of(Uncle, Other).

ancestor_of(X, Y) :- parent_of(X, Y).
ancestor_of(X, Y) :- parent_of(X, Z), ancestor_of(Z, Y).

not_parent(X, Y) :- not(parent_of(X, Y)).


% Does Harry have an uncle?
% ?- uncle_of(X, harry).
% X = vernon ;
% X = vernon ;
% false.

% Who are the grandparents of Harry?
% ?- grandmother_of(X, harry).
% X = ruth ;
% X = helen .
% ?- grandfather_of(X, harry).
% X = albert ;
% X = paul ;
% false.

% Who are the grandchildren of Paul and Helen?
% ?- grandmother_of(helen, X).
% X = harry ;
% X = dudley ;
% false.
% ?- grandfather_of(paul, X).
% X = harry ;
% X = dudley ;
% false.

% Does James have a sister?
% ?- sister_of(X, james).
% false.

% Is Albert an ancestor of Harry?
% ?- ancestor_of(albert, harry).
% true ;
% false.

% Who are the ancestors of Harry?
% ?- ancestor_of(X, harry).
% X = james ;
% X = lili ;
% X = paul ;
% X = helen ;
% X = albert ;
% X = ruth ;
% X = greatGrandfather ;
% X = greatGranmother ;
% false.

% Is Dudley an ancestor of Harry?
% ?- ancestor_of(dudley, harry).
% false.

% Who are the descendants of James?
% ?- ancestor_of(james, X).
% X = harry ;
% false.

% Is Dudley a parent of Harry?
% ?- not_parent(dudley, harry).
% true.