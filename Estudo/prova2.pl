% Banco de dados dinâmico
:- dynamic professor/2.

% Menu de cadastro de professores
cadastrar_professores :-
    write('Informe o nome do Professor: '), read(Nome),
    write('Informe a titulacao do professor (mestre/doutor): '), read(Titulacao),
    assertz(professor(Nome, Titulacao)),
    write('Deseja inserir mais dados? (s/n): '), read(Resposta),
    (Resposta == s -> cadastrar_professores ; true).

% Contagem de professores
quantidade_professores(Qtd) :-
    findall(Nome, professor(Nome, _), Lista),
    length(Lista, Qtd).

% Contagem de doutores
quantidade_doutores(Qtd) :-
    findall(Nome, professor(Nome, doutor), Lista),
    length(Lista, Qtd).

% Lista de todos os professores
listagem_professores(Lista) :-
    findall(Nome, professor(Nome, _), Lista).

% Lista de todos os doutores
listagem_doutores(Lista) :-
    findall(Nome, professor(Nome, doutor), Lista).

% Menu de relatórios
consultar_relatorios :-
    write('Qual relatório deseja saber?'), nl,
    write('(1- Quantidade de Professores, 2- Quantidade de Doutores, 3- Listagem de Professores, 4- Listagem de Doutores): '),
    read(Opcao),
    executar_relatorio(Opcao),
    write('Deseja consultar mais relatórios? (s/n): '), read(Resposta),
    (Resposta == s -> consultar_relatorios ; true).

% Execução do relatório baseado na escolha do usuário
executar_relatorio(1) :-
    quantidade_professores(Qtd),
    format('O campus Anápolis tem ~w professor(es).~n', [Qtd]).

executar_relatorio(2) :-
    quantidade_doutores(Qtd),
    format('O campus Anápolis tem ~w doutor(es).~n', [Qtd]).

executar_relatorio(3) :-
    listagem_professores(Lista),
    format('Os professores são: ~w~n', [Lista]).

executar_relatorio(4) :-
    listagem_doutores(Lista),
    format('Os doutores são: ~w~n', [Lista]).

% Função principal
inicio :-
    cadastrar_professores,
    consultar_relatorios.
