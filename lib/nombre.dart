class Nombre {
  late String candidato;
Nombre(String c){
  if (c.length<LongitudMinimaPermitida){ 
    throw LongitudMinimaExcepCion();
  }
      if (c.length > LongitudMaximaPermitida) {
      throw LongitudMaximaExcepCion();
    }
  if (c.isNotEmpty && _isDigit(c[0])) {
      throw CaracterNoPermitidoExcepcion();
    }
     final RegExp patronPermitido = RegExp(r'^[a-zA-Z0-9ñÑ]+$');

    if (!patronPermitido.hasMatch(c)) {
      throw CaracterNoPermitidoExcepcion();
    }
        this.candidato = c;
  }
}
bool _isDigit(String s) {
  return RegExp(r'\d').hasMatch(s);
}
const LongitudMinimaPermitida = 5;
const LongitudMaximaPermitida = 15;
class LongitudMinimaExcepCion extends Error{}
class LongitudMaximaExcepCion extends Error {}
class CaracterNoPermitidoExcepcion extends Error {}