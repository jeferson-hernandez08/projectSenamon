import 'senamon.dart';

//Punto 1 y 2
//Atributos de jugador 
class Entrenador {
  String nombre;
  String email;
  DateTime fechaNacimiento;
  int nivelExperiencia;
  int batallasGanadas;
  List<Senamon> equipo = [];

  // Constructor: Funcion que se ejecuta cuando se crea un objeto
  Entrenador(this.nombre, this.email, this.fechaNacimiento, this.nivelExperiencia, this.batallasGanadas);

  void mostrarInformacion() {
    print("""
            El jugador se llama: ${this.nombre}
            Su email es: ${this.email}
            Su fecha de nacimeinto es: ${this.fechaNacimiento}
            Nivel de expericiena: ${this.nivelExperiencia} 
            Batallas ganadas: ${this.batallasGanadas} 
         """);
  }

  void atraparSenamon(Senamon senamon) {
    if (equipo.length < 5) {
      equipo.add(senamon);
    } else {
      print('Equipo completo. Reemplace un Senamon si desea agregar otro.');
    }
  }

  void reemplazarSenamon(int posicion, Senamon nuevoSenamon) {
    if (posicion >= 0 && posicion < equipo.length) {
      equipo[posicion] = nuevoSenamon;
    } else {
      print('Posición no válida.');
    }
  }

  void entrenarSenamon(int posicion, int puntosAtaque, int puntosSalud) {
    if (posicion >= 0 && posicion < equipo.length) {
      Senamon senamon = equipo[posicion];
      int puntosRequeridos = (puntosAtaque + puntosSalud) * 10;
      if (nivelExperiencia >= puntosRequeridos) {
        senamon.nivelAtaque += puntosAtaque;
        senamon.puntosSalud += puntosSalud;
        nivelExperiencia -= puntosRequeridos;
        print('Senamon entrenado con éxito.');
      } else {
        print('No tienes suficiente experiencia para entrenar.');
      }
    } else {
      print('Posición no válida.');
    }
  }

  void mostrarEquipo() {
    print('Entrenador: $nombre');
    print('Equipo de Senamones:');
    for (var senamon in equipo) {
      senamon.mostrarInformacion();
    }
  }
}