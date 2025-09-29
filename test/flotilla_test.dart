import 'package:juegonaval/flotilla.dart';
import 'package:juegonaval/punto.dart';
import 'package:test/test.dart';

void main() {
  test('Debe tener 5 barcos', () {
    var barcosNumero = [
      Barco(tipo:TiposBarcos.bote,direccion: DireccionHacia.abajo,puntoInicial: Punto(columna: 1, fila: 1)),
      Barco(tipo:TiposBarcos.lancha,direccion: DireccionHacia.arriba,puntoInicial: Punto(columna: 1, fila: 1)),
      Barco(tipo:TiposBarcos.submarino,direccion: DireccionHacia.derecha,puntoInicial: Punto(columna: 1, fila: 1)),
      Barco(tipo:TiposBarcos.crucero,direccion: DireccionHacia.izquierda,puntoInicial: Punto(columna: 1, fila: 1)),
    ];
    expect(() => Flotilla(barcosNumero), throwsA(isA<FlotillaCantidadExcepcion>())
    );
  });
  test('Lanza FlotillaPosicionExcepcion si un barco se sale del tablero', () {
  var barcosFueraDeLugar = [
    Barco(tipo: TiposBarcos.bote, direccion: DireccionHacia.abajo, puntoInicial: Punto(columna: 1, fila: 1)),
    Barco(tipo: TiposBarcos.lancha, direccion: DireccionHacia.arriba, puntoInicial: Punto(columna: 3, fila: 3)),
    Barco(tipo: TiposBarcos.submarino, direccion: DireccionHacia.derecha, puntoInicial: Punto(columna: 5, fila: 5)),
    Barco(tipo: TiposBarcos.crucero, direccion: DireccionHacia.izquierda, puntoInicial: Punto(columna: 7, fila: 7)),
    Barco(tipo: TiposBarcos.portaAviones, direccion: DireccionHacia.derecha, puntoInicial: Punto(columna: 8, fila: 9)),
  ];
  expect(() => Flotilla(barcosFueraDeLugar), throwsA(isA<FlotillaPosicionExcepcion>())
  );
});

test('Lanza excepcion si los barcos estan juntos', () {
  var barcosPegados = [
    Barco(tipo: TiposBarcos.bote, puntoInicial: Punto(columna: 1, fila: 1), direccion: DireccionHacia.abajo),
    Barco(tipo: TiposBarcos.lancha, puntoInicial: Punto(columna: 2, fila: 1), direccion: DireccionHacia.abajo),
    Barco(tipo: TiposBarcos.submarino, puntoInicial: Punto(columna: 5, fila: 5), direccion: DireccionHacia.derecha),
    Barco(tipo: TiposBarcos.crucero, puntoInicial: Punto(columna: 8, fila: 8), direccion: DireccionHacia.izquierda),
    Barco(tipo: TiposBarcos.portaAviones, puntoInicial: Punto(columna: 10, fila: 1), direccion: DireccionHacia.abajo)
  ];
  expect(() => Flotilla(barcosPegados), throwsA(isA<FlotillaDistanciasBarcos>())
  );
});
}