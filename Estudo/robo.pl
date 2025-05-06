:- dynamic pos/2.
:- dynamic mao/1.

% Arquivo de persistência
arquivo_estado('estado.pl').

% Salva o estado atual em arquivo
salvar :-
    arquivo_estado(Arq),
    tell(Arq),
    listing(pos/2),
    listing(mao/1),
    told.

% Restaura o estado do arquivo
restaurar :-
    arquivo_estado(Arq),
    exists_file(Arq),
    retractall(pos(_, _)),
    retractall(mao(_)),
    consult(Arq).

% Exemplo de estado inicial
inicializar :-
    retractall(pos(_, _)),
    retractall(mao(_)),
    assertz(pos(robô, garagem)),
    assertz(pos(tv, sala)),
    salvar.

% Andar até um destino
ande(Dest) :-
    pos(robô, Orig),
    Orig \= Dest,
    format('anda de ~w até ~w~n', [Orig, Dest]),
    retract(pos(robô, Orig)),
    assertz(pos(robô, Dest)),
    salvar.

% Pegar objeto
pegue(Obj) :-
    pos(robô, Loc),
    pos(Obj, Loc),
    \+ mao(_),
    format('pega ~w~n', [Obj]),
    retract(pos(Obj, Loc)),
    assertz(mao(Obj)),
    salvar.

% Soltar objeto
solte(Obj) :-
    mao(Obj),
    pos(robô, Loc),
    format('solta ~w~n', [Obj]),
    assertz(pos(Obj, Loc)),
    retract(mao(Obj)),
    salvar.
