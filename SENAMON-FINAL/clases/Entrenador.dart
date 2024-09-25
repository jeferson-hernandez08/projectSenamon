import 'Menu.dart';
import 'Senamon.dart';

class Entrenador{
  String _nombre;
  String _email;
  String _fechaNacimiento;
  int _nivelExperiencia;
  int _batallasGanadas;
  List<Senamon> senamones = [];

  Entrenador(this._nombre, this._email, this._fechaNacimiento, this._nivelExperiencia, this._batallasGanadas, this.senamones);

  void setNivelExperiencia(int nivel){
    _nivelExperiencia += nivel;
  }

  void setBatallasGanadas(){
    _batallasGanadas ++;
  }

  String getNombre(){
    return _nombre;
  }

  List<Senamon> getSenamones(){
    return senamones;
  }

  int getBatallasGanadas(){
    return _batallasGanadas;
  }

  void mostrarInfo(){
    print("""
Nombre: $_nombre
Email: $_email
Fecha de nacimiento: $_fechaNacimiento
Nivel de experiencia: $_nivelExperiencia
Batallas ganadas: $_batallasGanadas
""");
    print("Senamones elegidos:");
    for (var i = 0; i < senamones.length; i++) {
      print("- ${senamones[i].getNombre()}");
    }
  }

  void entrenarSenamon(){
    if (_nivelExperiencia >= 200) {
      print("Ingrese el senamon que desea entrenar");
      print("*"*100);
      print("SENAMONES ELEGIDOS");
      for (var i = 0; i < senamones.length; i++) {
        print("${i + 1}. ${senamones[i].getNombre()}");
      }
      int pocision = validarPosicion(senamones);
      senamones[pocision - 1].subirNivel();
      _nivelExperiencia -= 20;
    }else{
      print("No puede entrenar a un senamon porque necesita al menos 200 de experiencia");
    }
  }

  void cambiarSenamon(List<Senamon> universoSenamon){
    print("SENAMONES ELEGIDOS");
    for (var i = 0; i < senamones.length; i++) {
      print("${i + 1}. ${senamones[i].getNombre()}");
    }
    print("Ingrese el número del senamon que desea cambiar");
    int pocisionElegido = validarPosicion(senamones);
    print("SENAMONES DISPONIBLES");
    for (var i = 0; i < universoSenamon.length; i++) {
      print("${i + 1}. ${universoSenamon[i].getNombre()}");
    }
    print("Ingrese el número del senamon que desea reemplazar por ${senamones[pocisionElegido - 1].getNombre()}");
    int pocisionReemplazo = validarPosicion(universoSenamon);
    universoSenamon.add(senamones[pocisionElegido - 1]);
    senamones.removeAt(pocisionElegido - 1);
    senamones.add(universoSenamon[pocisionReemplazo - 1]);
    universoSenamon.removeAt(pocisionReemplazo - 1);
    print("Los nuevos senamones elegidos son los siguientes:");
    for (var i = 0; i < senamones.length; i++) {
      print("${i + 1}. ${senamones[i].getNombre()}");
    }
  }
}