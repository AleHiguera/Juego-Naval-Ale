
const longitudMinimaPermitida = 5;
const longitudMaximaPermitida = 15;

class LongitudMinimaExcepcion extends Error {}
class LongitudMaximaExcepcion extends Error {}
class CaracterNoPermitidoExcepcion extends Error {}

class Nombre {
  late String candidato;

  Nombre(String c) {
    _validarLongitud(c);
    _validarInicio(c);
    _validarCaracteres(c);

    candidato = c;
  }

  static void _validarInicio(String c) {
    if (c.isNotEmpty && _isDigit(c[0])) {
      throw CaracterNoPermitidoExcepcion();
    }
  }

  static void _validarCaracteres(String c) {
    final RegExp patronPermitido = RegExp(r'^[a-zA-Z0-9ñÑ]+$');
    if (!patronPermitido.hasMatch(c)) {
      throw CaracterNoPermitidoExcepcion();
    }
  }
  
  static void _validarLongitud(String c) {
    if (c.length < longitudMinimaPermitida) {
      throw LongitudMinimaExcepcion();
    }
    if (c.length > longitudMaximaPermitida) {
      throw LongitudMaximaExcepcion();
    }
  }
}

bool _isDigit(String s) {
  return RegExp(r'\d').hasMatch(s);
}