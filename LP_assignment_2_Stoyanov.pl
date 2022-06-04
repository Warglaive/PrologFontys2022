% TASK 1 - List Exercises
% a.

list_lenght([], 0).
list_lenght([Head|Tail], Lenght) :-  list_lenght(Tail, TailLenght), Lenght is TailLenght + 1.

% ?- list_lenght([a,a,a],X).
% X = 3.

% ?- list_lenght([],X).
% X = 0.

% ?- list_lenght([a,b,c,d],X).
% X = 4.

% ?- list_lenght([a,b,[a,a,a]],X).
% X = 3.

% TASK 2 - Encryption Functionality
% a.

xor_check(0,0,0).
xor_check(1,1,0).
xor_check(1,0,1).
xor_check(0,1,1).

xor([], [], []).
xor([P|Plaintext], [K|Key], [C|Cipher]) :- xor_check(P, K, C), xor(Plaintext, Key, Cipher).

% ?- xor([0,0,0],[0,1,0],Z).
% Z = [0, 1, 0] ;
% false.

% ?- xor([1,1],[0,1],Z),xor(Z,[0,1],Y).
% Z = [1, 0],
% Y = [1, 1] ;
% false.

% ?- xor([1,1],[0,1],Z).
% Z = [1, 0] ;
% false.

% ?- xor(Z,[0,1],Y).
% Z = [0, 1],
% Y = [0, 0] ;
% Z = [0, 0],
% Y = [0, 1] ;
% Z = [1, 1],
% Y = [1, 0] ;
% Z = [1, 0],
% Y = [1, 1].