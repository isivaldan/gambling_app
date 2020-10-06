# README

Tarea NNode:

* Los jugadores parten con una cantidad de $10.000 por defecto.
* Los jugadores participan de una partida de ruleta automáticamente, cada 3 minutos.
* En cada ronda los jugadores apuestan entre un 8% y 15% del total de dinero que poseen. Si
tienen $1.000 o menos, van All In. Si no les queda dinero, no apuestan.
* La apuesta puede variar dependiendo del clima de Santiago de Chile, por lo que se debe
consultar alguna API, y en caso de que esté pronosticado una temperatura superior a 24oC
dentro de los próximos 7 días, las apuestas son más conservadoras y cambian a un valor
aleatorio entre 3% y 7%.
* El modo de apuesta es el siguiente: un jugador puede apostar a Verde, Rojo o Negro con un
2%, 49% y 49% de probabilidad respectivamente.
* Un jugador recupera el doble de lo apostado si acierta su apuesta, cuando ésta sea Rojo o
Negro, y recupera 15 veces lo apostado en caso de acertar Verde. En caso de perder la
apuesta, no recupera nada.
* La ruleta entrega resultados con la misma probabilidad que los jugadores hacen apuestas, es
decir, Verde 2%, Rojo 49% y Negro 49%.
* Al final del día, todos los jugadores reciben $10.000.
