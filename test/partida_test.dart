import 'package:juegonaval/partida.dart';
import 'package:test/test.dart';

void main() {
  test('1. Al crearse debe marcarse creada', () {
    Partida partida = new Partida();
    expect(partida.estado, equals(Estado.creada));
  });
  test('2. Al crearse debe elegir un turno inicial para un jugador', () {
    Partida partida = new Partida();
    expect(partida.quienVa, anyOf(Jugador.jugador1, Jugador.jugador2));
  });

  test('3. El valor de "quienVa" debe ser un tipo Jugador', () {
    Partida partida = new Partida();
    expect(partida.quienVa, isA<Jugador>());
  });

  test('4. El estado inicial NO debe ser iniciada', () {
    Partida partida = new Partida();
    expect(partida.estado, isNot(equals(Estado.iniciada)));
  });

  test('5. El turno inicial de "quienVa" no debe ser nulo (ya que se asigna en el constructor)', () {
    Partida partida = new Partida();
    expect(partida.quienVa, isNotNull);
  });
}