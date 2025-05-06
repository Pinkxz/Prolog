% Defina os fatos:

% Exercicio 1 e 2
% pai(joao, maria).
% pai(joao, jose).
% pai(carlos, joao).

avo(X, B) :- pai(Y, B), pai(X, Y).

% Exercicio 4
gosta(maria, musica).
gosta(maria, cinema).
gosta(joao, musica).
gosta(ana, cinema).

interesse_comum(X, Y) :- gosta(X, B), gosta(Y, B).

% Exercicio 5
homem(joao).
homem(pedro).
mulher(maria).
mulher(ana).

pai(joao, pedro).
pai(joao, ana).
mae(maria, pedro).
mae(maria, ana).

irmao(X, Y) :- homem(X), pai(B, Y), pai(B, X), X \= Y.
irma(X, Y) :- mulher(X), pai(B, X), pai(B, Y), X \= Y.

% Exercicio 6
aluno(joao).
aluno(maria).
tem_notas(joao).

sem_notas(X) :- aluno(X), \+ tem_notas(X).



% Exercicio 7
animal(cachorro).
animal(gato).
animal(cobra).
tem_pelos(cachorro).
tem_pelos(gato).

mamifero(X) :- tem_pelos(X).

% Exercicio 8
irmao(pedro, maria).
irma(ana, maria).
pai(maria, joao).


