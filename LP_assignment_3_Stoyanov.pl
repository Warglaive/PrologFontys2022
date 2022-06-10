% TASK 2

s --> np(subj), vp.
np(_) --> det, adj, n, rel.
np(_) --> negn, adj, n.
np(_) --> pn.
np(CASE) --> pro(CASE).
vp --> vi.
vp --> vt, np(obj).
vp --> vd, vin.
vp --> vd, vtn, np(obj).
vp --> vd, negv, vin.
vp --> vd, negv, vtn, np(obj).
rel --> [].
rel --> pro(relt), vp.

%% ----- Alphabet
det --> [a].
det --> [the].
n --> [bride].
n --> [nurse].
n --> [whiskey].
pn --> [bill].
pro(subj) --> [he].
pro(subj) --> [she].
pro(obj) --> [him].
pro(obj) --> [her].
pro(relt) --> [who].
pro(relt) --> [that].
vi --> [whistles].
vt --> [drinks].
vt --> [kills].
vtn --> [kill].
vtn --> [drink].
vin --> [whistle].
vd --> [does].
negv --> [not].
negn --> [no].
adj --> [].
adj --> [pretty].
adj --> [nice].

% ?- s([a,bride,drinks,a,bride],[]).
% true ;
% false.

% ?- s([a,bride,does,drink,a,bride],[]).
% true ;
% false.

% ?- s([a,nice,bride,does,not,drink,a,bride,who,does,not,kill,bill],[]).
% true ;
% false.

% ?- s([a,pretty,bride,does,not,drink,the,pretty,bride,who,does,not,kill,bill],[]).
% true ;
% false.

% ?- s([a,nice,bride,does,not,drink,a,bride,who,does,not,kill,bill],L).
% L = [who, does, not, kill, bill] ;
% L = [] ;

% ?- s(K,L).
% K = [a, bride, whistles|L] ;
% K = [a, bride, drinks, a, bride|L] ;
% K = [a, bride, drinks, a, bride, who, whistles|L] ;