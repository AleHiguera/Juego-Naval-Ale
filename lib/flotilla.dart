import 'package:juegonaval/elemento.dart';
import 'package:juegonaval/punto.dart';
import 'package:juegonaval/elemento.dart';
import 'package:juegonaval/punto.dart';

enum TiposBarcos { lancha, bote, submarino, crucero, portaAviones }

enum DireccionHacia { arriba, abajo, izquierda, derecha }

class Barco {
  final TiposBarcos tipo;
  final DireccionHacia direccion;
  final Punto puntoInicial;
  List<Elemento> _elemento = [];
  List<Elemento> get elementos => _elemento;
  Barco({
    required TiposBarcos tipo,
    required this.puntoInicial,
    required this.direccion,
  }) : tipo = tipo
  {
    int cuantasVeces = tamanosBarcos[tipo]!;
    int columna = puntoInicial.columna;
    int fila = puntoInicial.fila;
    while (cuantasVeces > 0) {
      _elemento.add(
        Elemento(
          punto: Punto(columna: columna, fila: fila),
         ),
         );
         columna = columna + dcolumna[direccion]!;
         fila = fila + dfila[direccion]!;
      cuantasVeces--;
    }
  }
}

var tamanosBarcos = {
  TiposBarcos.bote: 1,
  TiposBarcos.lancha: 2,
  TiposBarcos.submarino: 3,
  TiposBarcos.crucero: 4,
  TiposBarcos.portaAviones: 5,
};

var dfila = {
  DireccionHacia.abajo: 1,
  DireccionHacia.arriba: -1,
  DireccionHacia.izquierda: 0,
  DireccionHacia.derecha: 0,
};
var dcolumna = {
  DireccionHacia.abajo:0,
  DireccionHacia.arriba:0,
  DireccionHacia.derecha:1,
  DireccionHacia.izquierda:-1
  };

class Flotilla {
  List<Barco> _barcos;  
  int get cantidad => _barcos.length;
  Flotilla(this._barcos) {
    if (_barcos.length != 5) throw FlotillaCantidadExcepcion();
    if (_barcos.map((e) => e.tipo).toSet().length != 5) throw FlotillaTipos();
    for(final barco in _barcos){
      if(!barcoEstaDentroDelTablero(barco)){
        throw FlotillaPosicionExcepcion();
      }
    }
    if(!validarDistanciaDeFlotilla(_barcos)){
      throw FlotillaDistanciasBarcos();
    }
  }
}

bool tieneDistanciaAdecuada(List<Barco> barcos){
  return false;
}

bool barcosSeTocan(Barco barcoA, Barco barcoB) {
  for (var elemA in barcoA.elementos) {
    for (var elemB in barcoB.elementos) {
      final puntoA = elemA.punto;
      final puntoB = elemB.punto;
      final distanciaCol = (puntoA.columna - puntoB.columna).abs();
      final distanciaFila = (puntoA.fila - puntoB.fila).abs();
      if (distanciaCol <= 1 && distanciaFila <= 1) {
        return true; 
      }
    }
  }

  return false;
}

bool validarDistanciaDeFlotilla(List<Barco> barcos) {
  for (int i = 0; i < barcos.length; i++) {
    for (int j = i + 1; j < barcos.length; j++) {
      if (barcosSeTocan(barcos[i], barcos[j])) {
        print("Error: El ${barcos[i].tipo} está tocando al ${barcos[j].tipo}");
        return false;
      }
    }
  }
  return true;
}

bool barcoEstaDentroDelTablero(Barco barco, {int min = 1, int max = 10}) {
  for (final elemento in barco.elementos) {
    final punto = elemento.punto;   
    final bool estaFuera = 
        punto.fila < min ||
        punto.fila > max ||
        punto.columna < min ||
        punto.columna > max;
    if (estaFuera) {
      print("¡Error! El barco ${barco.tipo} en [${punto.fila}, ${punto.columna}] se sale del tablero.");
      return false; 
    }
  }
  return true;
}
class FlotillaDistanciasBarcos extends Error {}

class FlotillaCantidadExcepcion extends Error {}

class FlotillaTipos extends Error {}

class FlotillaPosicionExcepcion extends Error {}