== SIMULACION DE RULETA DE CASINO 

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

### Descripción:

Simulación que consiste en un grupo dinámico de personas jugando a la ruleta. El objetivo es crear un sistema para monitorear una mesa de casino.

### Competencias:
* Vistas que permiten ingresar jugadores, a los cuales se les pueden modificar sus datos y cantidad de dinero que poseen.
* Los jugadores parten con una cantidad de $10.000 por defecto.
* Los jugadores participan de una partida de ruleta automáticamente, cada 3 minutos.
* En cada ronda los jugadores apuestan entre un 8% y 15% del total de dinero que poseen. Si tienen $1.000 o menos, van All In. Si no les queda dinero, no apuestan.
* El modo de apuesta es el siguiente, un jugador puede apostar a Verde, Rojo o Negro con un 2%, 49% y 49% de probabilidad respectivamente.
* Un jugador recupera el doble de lo apostado si acierta su apuesta, cuando ésta sea Rojo o Negro, y recupera 15 veces lo apostado en caso de acertar Verde.
* En caso de perder la apuesta, no recupera nada.
* La ruleta entrega resultados con la misma probabilidad que los jugadores hacen apuestas, es decir, Verde 2%, Rojo 49% y Negro 49%.
* Al final del día, todos los jugadores reciben $10.000.
* Vista donde se muestran todas las rondas transcurridas, con la apuesta de cada jugador y el resultado de la ruleta.

### Instrucciones

```
%bundle
```

Para escribir tu archivo crontab y ejecutar los métodos programados en `/config/schedule.rb` necesitarás correr:

```sh
$ whenever --update-crontab
```

Puedes listar tus cron jobs instalados usando el comando `crontab -l`.

Corre `whenever --help` para una lista completa de opciones de eleccion del cronograma a usar, seteo de variables en el cronograma, selección del usuario a intalar en crontab, etc. 