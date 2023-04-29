s(p(X,Y,Z)) --> loop(X),st(Y),ife(Z) | loop(X), ife(Y), st(Z) | ifcondition(X), st(Y), lf(Z) | ifcondition(X), lf(Y), st(Z) | stmnt(X), lf(Y), ife(Z) | stmnt(X), ife(Y), lf(Z).
ife(l(I)) --> ifcondition(I).
ife(l()) --> [].
st(l(S)) --> stmnt(S).
st(l()) --> [].
lf(l(S)) --> loop(S).
lf(l()) --> [].
stif(l(T)) --> loop(T) | stmnt(T).
stwhile(l(T)) --> ifcondition(T) | stmnt(T).
loop(l(V,R,C,L,T)) --> lv(V), rb(R), condition(C), lb(L), loop(T) .
loop(l(V,R,C,L,T)) --> lv(V), rb(R), condition(C), lb(L), stwhile(T).
ifcondition(l(I,R,C,L,S,O,E)) --> ifd(I), rb(R), condition(C), lb(L), stif(S), els(O), stif(E) | ifd(I), rb(R), condition(C), lb(L), stif(S), els(O), ifcondition(E) | ifd(I), rb(R), condition(C), lb(L), ifcondition(S), els(O), ifcondition(E) | ifd(I), rb(R), condition(C), lb(L), ifcondition(S), els(O), stif(E) .
ifcondition(l(I,R,C,L,S)) --> ifd(I), rb(R), condition(C), lb(L), stif(S) | ifd(I), rb(R), condition(C), lb(L), ifcondition(S).
condition(l(V,C,E)) --> variables(V), comp(C), variables(E) | variables(V), comp(C), number(E) | number(V), comp(C), variables(E).
condition(l(V,O,E,C,X,Y,Z)) --> variables(V), operand(O), variables(E), comp(C), variables(X), operand(Y), variables(Z) | variables(V), operand(O), number(E), comp(C), variables(X), operand(Y), variables(Z) | variables(V), operand(O), variables(E), comp(C), variables(X), operand(Y), number(Z) | variables(V), operand(O), number(E), comp(C), variables(X), operand(Y), number(Z) .
condition(l(V,O,E,C,X)) --> variables(V), operand(O), variables(E), comp(C), variables(X) | variables(V), operand(O), number(E), comp(C), variables(X) .
condition(l(V,C,X,Y,Z)) --> variables(V), comp(C), variables(X), operand(Y), variables(Z) | variables(V), comp(C), variables(X), operand(Y), number(Z) .
stmnt(l(V,E,G)) --> variables(V), equal(E), equation(G).
equation(l(O,S)) --> q(O), sc(S).
eqn(l(O)) --> q(O).
q(l(O,V)) --> t(O), qa(V).
qa(l('%',O,V)) --> ['%'], t(O), qa(V) .
qa(l())-->[].
t(l(O,V)) --> u(O), ta(V).
ta(l('+',O,V)) --> ['+'], u(O), ta(V) .
ta(l())--> [].
u(l(O,V)) --> v(O), ua(V).
ua(l('-',O,V)) --> ['-'], v(O), ua(V) .
ua(l()) --> [].
v(l(O,V)) --> w(O),va(V).
va(l('*',O,V)) --> ['*'], w(O), va(V) .
va(l()) --> [].
w(l(O,V)) --> f(O), wa(V).
wa(l('/',O,V)) --> ['/'], f(O), wa(V) .
wa(l()) --> [].
f(l(R,E,L)) --> rb(R), eqn(E), lb(L).
f(l(V)) --> variables(V) | number(V).
variables(l(G)) --> letter(G).
variables(l(G,U)) -->  letter(G), vs(U).
vs(l(G,U)) -->  var(G), vs(U).
vs(l(V)) --> var(V).
var(l(L)) --> letter(L) | number(L).
sc(l(';')) --> [';'].
%letter(l(L)) --> ['a'] | ['A'] | ['b'] | ['B'] | ['c'] | ['C'] | ['D'] | ['d'] | ['E'] | ['e'] | ['f'] |['F'] | ['g'] | ['G'] | ['h'] | ['H'] | ['i'] | ['I'].
letter(l(L)) --> [L],{string_length(L,1),is_alpha(L)}.
rb(l('(')) --> ['('].
lb(l(')')) --> [')'].
ifd(l('if')) --> ['if'].
operand(l('+')) --> ['+'].
operand(l('*')) --> ['*'].
operand(l('/')) --> ['/'].
operand(l('-')) --> ['-'].
operand(l('%')) --> ['%'].
lv(l('while')) --> ['while'] .
comp(l('==')) --> ['=='].
comp(l('>=')) --> ['>='].
comp(l('<=')) --> ['<='].
comp(l('!=')) --> ['!='].
comp(l('<')) --> ['<'].
comp(l('>')) --> ['>'].
els(l('else')) --> ['else'].
number(l(N)) --> [N], {number(N)}.
equal(l('=')) --> ['='].


 


