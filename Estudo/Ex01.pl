funcionario(joao, mateus, 10).
funcionario(ted, mateus, 12).
funcionario(mateus, n00b, 15).
funcionario(sexo, joao, 5).
funcionario(transe, megan, 10).


naoEgerente(X) :- funcionario(X, _, _), \+ funcionario(_, X, _).