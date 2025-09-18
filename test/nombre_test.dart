import 'package:juegonaval/nombre.dart';
import 'package:test/test.dart';
void main() {
  test('Debe de tener un minimo de longitud', () {
  try {
    Nombre nombre= Nombre('');
    }catch (e){ 
      expect(true, equals(true));
      }
      expect(true, equals(false));
  });
}