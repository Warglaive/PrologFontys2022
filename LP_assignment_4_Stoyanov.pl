% DAY 4
% TASK 1
% Commented it out so the second task runs smoothely

% s(s(NpT,VpT))  --> np(NpT), vp(VpT).
% np(np(DetT,NT))  --> det(DetT), n(NT).
% np(np(PnT))  --> pn(PnT).
% vp(vp(ViT))  --> vi(ViT).
% vp(vp(VtT,NpT))  --> vt(VtT), np(NpT).


% Lexicon

% det(det(a))  --> [a].
% det(det(the))  --> [the].
% n(n(bride))  --> [bride].
% n(n(nurse))  --> [nurse].
% n(n(yakuza))  --> [yakuza].
% n(n(whiskey))  --> [whiskey].
% pn(pn(bill))  --> [bill].
% pn(pn(gogo))  --> [gogo].
% vi(vi(whistles)) --> [whistles].
% vi(vi(fights))   --> [fights].
% vt(vt(drinks))   --> [drinks].
% vt(vt(kills))  --> [kills].


% ?- s(P, WordList, []).
% P = s(np(det(a), n(bride)), vp(vi(whistles))),
% WordList = [a, bride, whistles] ;
% P = s(np(det(a), n(bride)), vp(vi(fights))),
% WordList = [a, bride, fights] ;
% P = s(np(det(a), n(bride)), vp(vt(drinks), np(det(a), n(bride)))),
% WordList = [a, bride, drinks, a, bride] ;
% P = s(np(det(a), n(bride)), vp(vt(drinks), np(det(a), n(nurse)))),
% WordList = [a, bride, drinks, a, nurse] ;
% P = s(np(det(a), n(bride)), vp(vt(drinks), np(det(a), n(yakuza)))),
% WordList = [a, bride, drinks, a, yakuza] .


% TASK 2

s(s(NPT,VPT)) --> np(NPT), vp(VPT). 
% noun phrases
np(np(DetT,NT)) --> det(DetT), n(NT). % noun in neutral form
np(np(DetT,NFT)) --> det(DetT), nf(NFT). % noun in female form
np(np(DetT,NMT)) --> det(DetT), nm(NMT). % noun in male form
np(np(DetT,AFT,NFT)) --> det(DetT), adjf(AFT), nf(NFT). % adjective and noun in female form
np(np(DetT,AMT,NMT)) --> det(DetT), adjm(AMT), nm(NMT). % adjective and noun in male form
np(np(DetT,AFT,NFT,RelT)) --> det(DetT), adjf(AFT), nf(NFT), rel(RelT). % adjective and noun in female form
np(np(DetT,AMT,NMT,RelT)) --> det(DetT), adjm(AMT), nm(NMT), rel(RelT). % adjective and noun in male form
np(np(NegT, AMT, NMT)) --> neg(NegT), adjm(AMT), nm(NMT). % adjective and noun in male form
np(np(NegT, AFT, NFT)) --> neg(NegT), adjf(AFT), nf(NFT). % adjective and noun in female form
np(np(DetT,AT,NT,RelT)) --> det(DetT), adj(AT), n(NT), rel(RelT). % adjective and noun in neutral form
np(np(NegT, AT, NT)) --> neg(NegT), adj(AT), n(NT). % adjective and noun in neutral form
np(np(NegT, PN)) --> neg(NegT), pn(PN). % negative and noun that does need a determiner
np(np(PN)) --> pn(PN). % noun that does not need a determiner
% verb phrases
vp(vp(VT,PN)) --> vt(VT), pn(PN). % verb that needs a noun and a noun that does not need a determiner
vp(vp(VT,NP)) --> vt(VT), np(NP). % verb that needs a noun and a noun phrase
vp(vp(VIT)) --> vi(VIT). % verb that does not need a noun
vp(vp(VDT,NEGVT,VINT)) --> vd(VDT), negv(NEGVT), vin(VINT). % verb that needs a noun, but in pure form, so that we can use the verb does (and negative(not)) with it
vp(vp(VDT,VINT)) --> vd(VDT), vin(VINT). % again does + verb in pure form (without the S in the end), verb doesn't need a noun after
vp(vp(VDT,VTNT,NPT)) --> vd(VDT), vtn(VTNT), np(NPT). % does + verb that needs a noun + noun phrase
vp(vp(VDT,NEGVT,VINT)) --> vd(VDT), negv(NEGVT), vin(VINT). % does + not + verb that doesn't need a noun
vp(vp(VDT,NEGVT,VTNT,NPT)) --> vd(VDT), negv(NEGVT), vtn(VTNT), np(NPT). % does + not + verb + noun phrase
rel(rel(PT, VPT)) --> pro(PT), vp(VPT). % who/that + verb phrase


pro(pro(who)) --> [who].
pro(pro(that)) --> [that].
nf(nf(bride)) --> [bride]. % female noun
nf(nf(nurse)) --> [nurse]. % female noun
nm(nm(devil)) --> [devil]. % male noun
nm(nm(man)) --> [man]. % male noun
n(n(whiskey)) --> [whiskey]. % neutral noun
pn(pn(bill)) --> [bill]. % noun that needs no determiner
vt(v(kills)) --> [kills]. % verb that needs a noun after in 3rd person form (S in the end)
vt(v(drinks)) --> [drinks]. % verb that needs a noun after in 3rd person form (S in the end)
vi(vi(whistles)) --> [whistles]. % independent verb in 3rd person form (S in the end)
vtn(vtn(kill)) --> [kill]. % verb needs a noun afterwards in pure form (no S in the end)
vtn(vtn(drink)) --> [drink]. % verb needs a noun afterwards in pure form (no S in the end)
vin(vin(whistle)) --> [whistle]. % independent verb in pure form (no S in the end)
vd(vd(does)) --> [does].
det(det(the)) --> [the].
det(det(a)) --> [a].
adj(adj()) --> []. % no adjective (empty)
adj(adj(bad)) --> [bad]. % neutral adjective
adj(adj(nice)) --> [nice]. % neutral adjective
adjf(adjf(pretty)) --> [pretty]. % female adjective
adjm(adjm(handsome)) --> [handsome]. % male adjective
neg(neg(no)) --> [no].
negv(negv(not)) --> [not].


% ?- s(Tree,[the,handsome,devil,who,does,not,kill,bill,drinks,a,whiskey],[]).
% Tree = s(np(det(the), adjm(handsome), nm(devil), rel(pro(who), vp(vd(does), negv(not), vtn(kill), np(pn(bill))))), vp(v(drinks), np(det(a), n(whiskey)))) ;
% false.

% ?- s(Tree,[a,pretty,nurse,does,not,kill,bill],[]).
% Tree = s(np(det(a), adjf(pretty), nf(nurse)), vp(vd(does), negv(not), vtn(kill), np(pn(bill)))) ;
% false.

% Generated as much as possible to show more:

% ?- s(P, WordList, []).
% P = s(np(det(the), n(whiskey)), vp(v(kills), pn(bill))),
% WordList = [the, whiskey, kills, bill] ;
% P = s(np(det(the), n(whiskey)), vp(v(drinks), pn(bill))),
% WordList = [the, whiskey, drinks, bill] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), n(whiskey)))),
% WordList = [the, whiskey, kills, the, whiskey] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(a), n(whiskey)))),
% WordList = [the, whiskey, kills, a, whiskey] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), nf(bride)))),
% WordList = [the, whiskey, kills, the, bride] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), nf(nurse)))),
% WordList = [the, whiskey, kills, the, nurse] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(a), nf(bride)))),
% WordList = [the, whiskey, kills, a, bride] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(a), nf(nurse)))),
% WordList = [the, whiskey, kills, a, nurse] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), nm(devil)))),
% WordList = [the, whiskey, kills, the, devil] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), nm(man)))),
% WordList = [the, whiskey, kills, the, man] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(a), nm(devil)))),
% WordList = [the, whiskey, kills, a, devil] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(a), nm(man)))),
% WordList = [the, whiskey, kills, a, man] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride)))),
% WordList = [the, whiskey, kills, the, pretty, bride] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(nurse)))),
% WordList = [the, whiskey, kills, the, pretty, nurse] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(a), adjf(pretty), nf(bride)))),
% WordList = [the, whiskey, kills, a, pretty, bride] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(a), adjf(pretty), nf(nurse)))),
% WordList = [the, whiskey, kills, a, pretty, nurse] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjm(handsome), nm(devil)))),
% WordList = [the, whiskey, kills, the, handsome, devil] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjm(handsome), nm(man)))),
% WordList = [the, whiskey, kills, the, handsome, man] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(a), adjm(handsome), nm(devil)))),
% WordList = [the, whiskey, kills, a, handsome, devil] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(a), adjm(handsome), nm(man)))),
% WordList = [the, whiskey, kills, a, handsome, man] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), pn(bill)))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, bill] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(drinks), pn(bill)))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, drinks, bill] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(the), n(whiskey))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, the|...] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(a), n(whiskey))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, a|...] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(the), nf(bride))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, the|...] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(the), nf(nurse))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, the|...] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(a), nf(bride))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, a|...] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(a), nf(nurse))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, a|...] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(the), nm(devil))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, the|...] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(the), nm(man))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, the|...] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(a), nm(devil))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, a|...] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(a), nm(man))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, a|...] ;
% P = s(np(det(the), n(whiskey)), vp(v(kills), np(det(the), adjf(pretty), nf(bride), rel(pro(who), vp(v(kills), np(det(the), adjf(pretty), nf(bride))))))),
% WordList = [the, whiskey, kills, the, pretty, bride, who, kills, the|...] ;
% and so on..
