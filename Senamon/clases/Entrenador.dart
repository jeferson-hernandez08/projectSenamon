//Punto 1 y 2   //nombre, email, fecha de nacimiento, su nivel de experiencia y la cantidad de batallas ganadas.
import 'Senamon.dart';

class Entrenador {
  //Atributos de jugador 
  String _nombre;
  String _email;
  String _fechaNacimiento;
  double _nivelExperiencia;
  int _batallasGanadas;
  List<Senamon> _mySenamones = [];      //Lista de senamones del jugador.


   // Constructor: Funcion que se ejecuta cuando se crea un objeto
  Entrenador(this._nombre, this._email, this._fechaNacimiento, this._nivelExperiencia, this._batallasGanadas);

  //Setters y Getters.
  void getMySenamones(List<Senamon> senamones) {
    _mySenamones = senamones;
  }

  List getSenamones() {
    return _mySenamones;
  }

  void agregarSenamon(Senamon newSenamon) {
    _mySenamones.add(newSenamon);
  }

  void mostrarSenamones() {
    for (int i = 0; i < _mySenamones.length; i++ ) {   //Mostrar lista de senamones de Entrenador
      print("Posición: ${i}");
       _mySenamones[i].mostrarInformacion();
    }
  }

  //Punto 3. Mejorar pokemon
  void entrenarPokemon() {
    if ( _nivelExperiencia >= 200 ) {
      print("Has incrementado 20 puntos al pokemon"); 
    } 
    else {
      print("No tiene suficiente experecia para mejorar pokemon");
    }
  }

  void mostrarInformacion() {
    print("""
            El jugador se llama: ${this._nombre}
            Su email es: ${this._email}
            Su fecha de nacimeinto es: ${this._fechaNacimiento}
            Nivel de expericiena: ${this._nivelExperiencia} 
            Batallas ganadas: ${this._batallasGanadas} 
         """);
  }

}