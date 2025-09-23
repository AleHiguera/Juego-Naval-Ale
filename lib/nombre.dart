const longitudMinimaPermitida = 5;
const longitudMaximaPermitida = 15;

// Definición de las clases de excepciones para cada tipo de error
class LongitudMinimaExcepcion extends Error {}
class LongitudMaximaExcepcion extends Error {}
class CaracterNoPermitidoExcepcion extends Error {}

class Nombre {
  late String candidato;

  Nombre(String c) {
    _validarLongitud(c);
    _validarInicio(c);
    _validarCaracteres(c);
    
    // Eliminamos 'this.' ya que es innecesario
    candidato = c;
  }

  // Valida que el nombre no empiece con un numero
  static void _validarInicio(String c) {
    if (c.isNotEmpty && _isDigit(c[0])) {
      throw CaracterNoPermitidoExcepcion();
    }
  }

  // Valida que el nombre contenga solo caracteres permitidos
  static void _validarCaracteres(String c) {
    final RegExp patronPermitido = RegExp(r'^[a-zA-Z0-9ñÑ]+$');
    if (!patronPermitido.hasMatch(c)) {
      throw CaracterNoPermitidoExcepcion();
    }
  }
  
  // Valida que el nombre cumpla con los límites de longitud
  static void _validarLongitud(String c) {
    if (c.length < longitudMinimaPermitida) {
      throw LongitudMinimaExcepcion();
    }
    if (c.length > longitudMaximaPermitida) {
      throw LongitudMaximaExcepcion();
    }
  }
}

// Función auxiliar para verificar si un caracter es un digito
bool _isDigit(String s) {
  return RegExp(r'\d').hasMatch(s);
}