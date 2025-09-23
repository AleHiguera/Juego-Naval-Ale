import 'package:juegonaval/nombre.dart';
import 'package:test/test.dart';
void main() {
  test('Debe de tener un minimo de longitud', () {
expect(() => Nombre(''), throwsA(isA<LongitudMinimaExcepcion>()));
  
  });
 test('No debe de pasar un maximo de longitud', () {
    expect(
      ()=> Nombre('a12345678912345ssss6'), 
      throwsA(isA<LongitudMaximaExcepcion>()),
      );
  
  });
   test('Se permite los caracteres normales', () {
    Nombre nombre = Nombre('alehi');
    expect(true, equals(true));
  });
  test('No se permite los caracteres extraños', () {
     expect(()=> Nombre('aleh.'), throwsA(isA<CaracterNoPermitidoExcepcion>()));
  });
    test('No puede empezar con numero', () {  
     expect(()=> Nombre('1aleh'), throwsA(isA<CaracterNoPermitidoExcepcion>()));
  });
     test('Se permite ñ', () {
    Nombre nombre = Nombre('ñoñoo');
    expect(true, equals(true));
  });
}