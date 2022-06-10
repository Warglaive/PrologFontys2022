s(s(NPT,VPT)) --> np(NPT), vp(VPT).
np(np(DetT,NT)) --> det(DetT), n(NT).
np(np(DetT,AT,NT,RelT)) --> det(DetT), adj(AT), n(NT), rel(RelT).
np(np(NegT, AT, NT)) --> neg(NegT), adj(AT), n(NT).
np(np(NegT, PN)) --> neg(NegT), pn(PN).
np(np(PN)) --> pn(PN).
vp(vp(VT,PN)) --> v(VT), pn(PN).
vp(vp(VT,NP)) --> v(VT), np(NP).
rel(rel(PT, VPT)) --> pro(PT), vp(VPT).
pro(pro(who)) --> [who].
n(n(bride)) --> [bride].
v(v(kills)) --> [kills].
det(det(the)) --> [the].
pn(pn(bill)) --> [bill].
adj(adj(bad)) --> [bad].
neg(neg(no)) --> [no].


% ?- s(Tree,[the,bride,kills,bill],[]).
% Tree = s(np(det(the), n(bride)), vp(v(kills), pn(bill))) ;
% Tree = s(np(det(the), n(bride)), vp(v(kills), np(pn(bill)))) ;
% false.