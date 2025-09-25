import 'dart:ffi';

import 'package:juegonaval/elemento.dart';
import 'package:juegonaval/punto.dart';
enum TiposBarcos{bote, lancha,submarino, crucero, portaaviones}

enum DireccionHacia{arrriba, abajo, izquierda, derecha}

class Barco{
  final TiposBarcos tipo;
  final DireccionHacia dureccion;
  final Punto puntoinicial;
 List<Elemento> _elementos = [];
  Barco ({
    required this.tipo, 
    required this.puntoinicial, 
    required this.dureccion
    }) {
   
  }
}

class Flotilla{
  final List<Barco> _barcos;
  int get cantidad =>_barcos.length;
  Flotilla(this._barcos) {
  if ( !esCantidadCorrecta(_barcos)) throw FlotillaCantidadExcepcion();
  if ( !sonTiposCorrectos(_barcos)) throw FlotillaTiposExcepcion();
    if ( !estanEnPosicionAdecuada (_barcos)) throw FlotillaPosicionExcepcion();
 }

bool estanEnPosicionAdecuada(List<Barco> barcos){
  return false;
} 
}

bool esCantidadCorrecta(List<Barco> barcos){
  return barcos.length ==5;
  }

  bool sonTiposCorrectos(List<Barco> barcos){
  return barcos.map ((e)=> e.tipo).toSet ().length==5;
  }

class FlotillaPosicionExcepcion extends Error{ } 

class FlotillaCantidadExcepcion extends Error{ }

class FlotillaTiposExcepcion extends Error{ }