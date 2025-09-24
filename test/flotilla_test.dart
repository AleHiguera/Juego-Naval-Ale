import 'package:juegonaval/flotilla.dart';
import 'package:test/test.dart';

void main (){
 
    test('Cuando creo una flotilla debe de tener 5 tipos de barcos', () { 
     expect(()=>Flotilla ([Barco(TiposBarcos.bote), Barco(TiposBarcos.crucero)]), throwsA(isA<FlotillaCantidadExcepcio>()));
  });
  }