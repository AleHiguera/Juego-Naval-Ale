import 'package:juegonaval/punto.dart';
import 'package:test/test.dart';

void main() {

  test('1,1) y el(2,1) deben de estar a 1 de distancia', () {
    Punto p1 =Punto(columna: 1,fila: 1);
    Punto p2 =Punto(columna: 2,fila: 1);
    expect(p1.distancia(p2), equals(1));
  });
  }  