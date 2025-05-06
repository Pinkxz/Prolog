% Base de conhecimento
funcionario(ana, paulo, 5000).
funcionario(joao, paulo, 4500).
funcionario(carla, ana, 4500).
funcionario(mario, teste, 3500).
funcionario(julia, joao, 3600).
funcionario(ricardo, carla, 3000).
funcionario(paulo, n00b, 6000). % Paulo é o chefe da empresa

% Regra para definir se um funcionário é subordinado (direto ou indireto) de um gerente
subordinado(X, G) :- funcionario(X, G, _).
subordinado(X, Y) :- funcionario(X, G, _), funcionario(G, Y, _).

% Consulta:
% ?- subordinado(F, paulo).


% Regra para somar os salários e contar os funcionários
soma_salarios_e_conta(Soma, Count) :-
    soma_salarios_e_conta_aux(0, 0, Soma, Count).

soma_salarios_e_conta_aux(SomaAcc, CountAcc, Soma, Count) :-
    funcionario(_, _, Salario),
    \+ ja_contado(Salario), % Garante que cada salário seja contado apenas uma vez
    assertz(ja_contado(Salario)), % Marca como contado
    NovoSoma is SomaAcc + Salario,
    NovoCount is CountAcc + 1,
    soma_salarios_e_conta_aux(NovoSoma, NovoCount, Soma, Count).
soma_salarios_e_conta_aux(Soma, Count, Soma, Count).

% Limpa os fatos auxiliares antes da execução
reset_contagem :- retractall(ja_contado(_)).

% Regra para calcular a media salarial
media_salarial(Media) :-
    reset_contagem, % Remove qualquer estado anterior
    soma_salarios_e_conta(Soma, Count),
    Count > 0, % Evita divisão por zero
    Media is Soma / Count,
    !. % O cut garante que apenas um resultado seja retornado
