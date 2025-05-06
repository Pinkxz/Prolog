funcionario(joao, mateus, 10).
funcionario(ted, mateus, 12).
funcionario(mateus, n00b, 15).
funcionario(sexo, joao, 5).
funcionario(transe, megan, 10).

gerente(X, Y, _) :- funcionario(Y, X, _).
gerente(X, B, _) :- funcionario(Y, X, _), funcionario(B, Y, _).

contar(A, B) :-
    A =< B,
    writeln(A),
    A1 is A + 1,
    contar(A1, B).

contar(A, B) :-
    A > B.
