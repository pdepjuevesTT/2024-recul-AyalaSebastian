% Solución en Prolog
%nombre: AYALA SEBASTIAN

%vive(Persona, Propiedad).
vive(juan, casa(120)).
vive(nico, departamento(3,2)).
vive(alf, departamento(3,1)).
vive(julian, loft(2000)).
vive(vale, departamento(4,1)).
vive(fer, casa(110)).
%felipe no se sabe donde vive

seQuiereMudar(rocio, casa(90)).

localidad(alf, almagro).
localidad(juan, almagro).
localidad(nico, almagro).
localidad(julian, almagro).
localidad(vale, flores).
localidad(fer, flores).

%punto 2
esCopada(casa(Metros)):-
    Metros > 100.

esCopada(departamento(Ambiente, _)):-
    Ambiente > 3.
esCopada(departamento(_, Banio)):-
    Banio > 1.

esCopada(loft(Anios)):-
    Anios > 2015.

viveEnPropiedadCopada(Persona):-
    vive(Persona, Propiedad),
    esCopada(Propiedad).

barrioCopado(Barrio):-
    forall((localidad(Persona, Barrio)), (viveEnPropiedadCopada(Persona))),
    localidad(Persona, Barrio). %otra opcion es eliminando esto 

%punto 3
barato(loft(Anios)):-
    Anios < 2005.
barato(casa(Metros)):-
    Metros < 90.
barato(departamento(1,_)).
barato(departamento(2,_)).

viveEnPropiedadBarata(Persona):-
    vive(Persona, Propiedad),
    barato(Propiedad).

barrioCaro(Barrio):-
    forall(localidad(Persona, Barrio), not(viveEnPropiedadBarata(Persona))),
    localidad(Persona, Barrio).

%punto 4 
valorPropiedadDe(juan, 150000).
valorPropiedadDe(nico, 80000).
valorPropiedadDe(alf, 150000).
valorPropiedadDe(julian, 140000).
valorPropiedadDe(vale, 95000).
valorPropiedadDe(fer, 60000).

sublist([250000|0]).

%sin listas
comprarCasaDe(Persona, Dinero, DineroRestante):-
    valorPropiedadDe(Persona, Valor),
    Dinero >= Valor,
    cuantoQueda(Dinero, Valor, DineroRestante).
    
cuantoQueda(Dinero, Valor, DineroRestante):-
    DineroRestante is Dinero - Valor.

%con listas

  
