class Nombre {
  late String candidato;
Nombre(String c){
  if (c.length<LongitudMinimaPermitida){ 
    throw LongitudMinimaExcepCion();
  }
  }
}
const LongitudMinimaPermitida = 5;

class LongitudMinimaExcepCion extends Error{
  }