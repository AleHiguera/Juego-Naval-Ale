import 'dart:math'; // Necesitas esta librería para usar Random

enum Estado {
  creada,
  iniciada,
  terminada
}

// Nuevo enum para representar a los dos jugadores (para los turnos)
enum Jugador {
  jugador1,
  jugador2
}

class Partida {
  late Estado estado; 
  late Jugador quienVa; 
  final Random _random = Random();

  Partida() {
    estado = Estado.creada; 
    _elegirPrimerTurno();
  }

  void _elegirPrimerTurno() {
    final int randomValue = _random.nextInt(2); 

    if (randomValue == 0) {
      quienVa = Jugador.jugador1;
    } else {
      quienVa = Jugador.jugador2;
    }
  }
}