% Definição dos fatos
pessoa(ana, fem, 23, 1.55, 56.0).
pessoa(bia, fem, 19, 1.71, 61.3).
pessoa(ivo, masc, 22, 1.80, 70.5).
pessoa(lia, fem, 17, 1.85, 57.3).
pessoa(eva, fem, 28, 1.75, 68.7).
pessoa(ary, masc, 25, 1.72, 68.9).

% Consulta a) Mulheres com mais de 20 anos
mulher_maior_20(Nome) :-
    pessoa(Nome, fem, Idade, _, _),
    Idade > 20.

altura_peso_restrito(Nome) :-
    pessoa(Nome, _,_, Altura, Peso),
    Altura > 1.70,
    Peso < 65.0.

casal_possivel(Nome1, Nome2) :-
    pessoa(Nome1, masc, _, Altura1, _),
    pessoa(Nome2, fem, _, Altura2, _),
    Altura1 > Altura2.

% Consulta b) Pessoas com pelo menos 1.70m de altura e menos de 65kg
% ?- mulher_maior_20(Nome).
% ?- altura_peso_restrito(Nome).
% ?- casal_possivel(Homem, Mulher).