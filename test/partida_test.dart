import 'package:juegonaval/juegonaval.dart';
import 'package:juegonaval/partida.dart';
import 'package:test/test.dart';

void main() {
  test('Al crearse debe marcarse creada', () {
    Partida partida= new Partida();
    expect(partida.estado, equals (Estado.creada));
  });
}