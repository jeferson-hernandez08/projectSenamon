import 'dart:io';
import 'Batalla.dart';
import 'Entrenador.dart';
import 'Senamon.dart';

class Menu {
  int numeroEntrenador;

  Menu(this.numeroEntrenador);

  void elegirEntrenador(List<Entrenador> entrenadores){
    print("Ingrese el número del entrenador que está jugando, ingrese 1 o 2");
    numeroEntrenador = validarPosicion(entrenadores) - 1;
  }

  void mostrarInfoEntrenador(List<Entrenador> entrenadores){
    entrenadores[numeroEntrenador].mostrarInfo();
  }
  
  void entrenarSenamon(List<Entrenador> entrenadores){
    entrenadores[numeroEntrenador].entrenarSenamon();
  }

  void crearSenamon(List<Entrenador> entrenadores, List<Senamon> universoSenamon){
    print("*"*100);
    print("CREACIÓN DEL SENAMON");
    print("Ingrese el nombre del Senamon");
    String nombre = stdin.readLineSync()!;
    List<String> tiposSenamones = ["fuego", "agua", "hierva", "volador", "eléctrico"];
    for (var i = 0; i < tiposSenamones.length; i++) {
      print("${i + 1}. ${tiposSenamones[i]}");
    }
    print("Ingrese el número del tipo de senamon");
    int pocisionTipo = validarPosicion(tiposSenamones);
    int puntos = 215;
    print("Puntos disponibles: $puntos");
    print("Ingrese el número de puntos que desea agregar a la salud de $nombre");
    int salud = validarRango(puntos, 1);
    puntos -= salud;
    print("Ingrese el número de puntos que desea agregar al ataque de $nombre");
    int ataque = validarRango(puntos, 1);
    puntos -= ataque;
    print("Ingrese la descripción del Senamon");
    String descripcionSenamon = stdin.readLineSync()!;
    Senamon senamon = Senamon(nombre, salud, ataque, 1, tiposSenamones[pocisionTipo - 1], descripcionSenamon);
    universoSenamon.add(senamon);
    print("*"*100);
    print("Se ha creado el Senamon con las siguientes características:");
    senamon.mostrarInfo();
  }

  void cambiarSenamonesElegidos(List<Entrenador> entrenadores, List<Senamon> universoSenamon){
    int opcion;
    do {
      print("*"*100);
      print("1. Cambiar Senamon");
      print("2. Salir al menú principal");
      opcion = int.parse(stdin.readLineSync()!);
      switch(opcion){
        case 1:
          print("*"*100);
          entrenadores[numeroEntrenador].cambiarSenamon(universoSenamon);
          break;

        case 2:
          print("Saliendo al menú principal...");
          break;

        default:
          print("Ingrese una opción correcta");
          break;
      }
    } while (opcion != 2);
  }

  void mostrarInfoSenamones(List<Entrenador> entrenadores, List<Senamon> universoSenamon){
    int opcion;
    do {
      print("*"*100);
      print("1. Ver información de un Senamon elegido");
      print("2. Ver información de un Senamon no elegido");
      print("3. Volver al menú principal");
      opcion = int.parse(stdin.readLineSync()!);
      switch(opcion){
        case 1:
          print("*"*100);
          print("SENAMONES DISPONIBLES");
          for (var i = 0; i < entrenadores[numeroEntrenador].senamones.length; i++) {
            print("${i + 1}. ${entrenadores[numeroEntrenador].senamones[i].getNombre()}");
          }
          print("Ingrese el número del senamon que desea ver su información");
          int pocisionSenamon = validarPosicion(entrenadores[numeroEntrenador].senamones);
          print("*"*100);
          entrenadores[numeroEntrenador].senamones[pocisionSenamon - 1].mostrarInfo();
          break;

        case 2:
        print("*"*100);
          print("SENAMONES NO ELEGIDOS");
          for (var i = 0; i < universoSenamon.length; i++) {
            print("${i + 1}. ${universoSenamon[i].getNombre()}");
          }
          print("Ingrese el número del senamon que desea ver su información");
          int pocisionSenamon = validarPosicion(universoSenamon);
          print("*"*100);
          universoSenamon[pocisionSenamon - 1].mostrarInfo();
          break;

        case 3:
          print("Saliendo al menú principal...");
          break;

        default:
          print("Ingrese una opción correcta");
          break;
      }
    } while (opcion != 3);
  }

  void batalla(List<Entrenador> entrenadores){
    Batalla batalla = Batalla(entrenadores, [], 0, 1, true);
    print("*"*100);
    print("BATALLA");
    batalla.setEntrenadoresCopia();
    batalla.setCopiaSenamones();
    batalla.lanzarMoneda();
    do {
      batalla.atacar();
      batalla.terminarRonda();
    } while (batalla.getContinuar());
    print("El entrenador: ${entrenadores[batalla.getPosicionEntrenador()].getNombre()} ha ganado la partida");
    entrenadores[batalla.getPosicionEntrenador()].setBatallasGanadas();
    entrenadores[batalla.getPosicionEntrenador()].setNivelExperiencia(100);
    print("Total de batallas ganadas: ${entrenadores[batalla.getPosicionEntrenador()].getBatallasGanadas()}");
    print("Ha ganado 100 puntos de experiencia");
  }

}

int validarPosicion(List<dynamic> lista){
  int posicion = int.parse(stdin.readLineSync()!);
  do {
    if (posicion < 1 || posicion > lista.length) {
      print("Ingrese una opción válida que esté dentro de la lista");
      posicion = int.parse(stdin.readLineSync()!);
    }
  } while (posicion < 1 || posicion > lista.length);
  return posicion;
}