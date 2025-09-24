enum TiposBarcos{bote, lancha,submarino, crucero, portaaviones}
class Barco{
  TiposBarcos tipo;
  Barco (this.tipo);
}


class Flotilla{
  List<Barco> _barcos;
  int get cantidad =>_barcos.length;
  Flotilla(this._barcos) {
  if ( !esCantidadCorrecta(_barcos)) throw FlotillaCantidadExcepcio();
  if ( !sonTiposCorrectos(_barcos)) throw FlotillaTipos();
    if ( !estanEnPosicionAdecuada (_barcos)) throw FlotillaTipos;
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
class FlotillaCantidadExcepcio extends Error{ }
class FlotillaTipos extends Error{ }