//Punto 1 y 2   //nombre, email, fecha de nacimiento, su nivel de experiencia y la cantidad de batallas ganadas.
import 'Senamon.dart';

class Entrenador {
  //Atributos de jugador 
  String _nombre;
  String _email;
  String _fechaNacimiento;
  double _nivelExperiencia;
  int _batallasGanadas;
  List<Senamon> mySenamones = [];      //Lista de senamones del jugador.


   // Constructor: Funcion que se ejecuta cuando se crea un objeto
  Entrenador(this._nombre, this._email, this._fechaNacimiento, this._nivelExperiencia, this._batallasGanadas);

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