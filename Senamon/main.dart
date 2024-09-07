import 'dart:io';
import 'dart:math';
import 'clases/Senamon.dart';
import 'clases/Entrenador.dart';

//Punto 7. Moneda aleatoria
void monedaAleatoria(List<String> moneda) {
  var random = Random();
  // Barajar las listas para asegurarse de que estén en orden aleatorio
  moneda.shuffle(random);
  print(moneda.first);   //Se usa .firts para acceder al primer elemento de la lista de haber sido barajada. Dado que la lista está en un orden aleatorio, este elemento será efectivamente uno aleatorio de la lista.
  
}

void main() {
  List<String> moneda = ["cara", "sello"];
  monedaAleatoria(moneda);

  int opcion;  //Variable para preguntar opción del menú
  //Lista del mundo senamon.
  List<Senamon> universoSenamon = [
    Senamon("Pikachu", "medio", "Electrico", 3.5, 100, 200, 1, 200, "Este pokemon es electrico"),
    Senamon("Bulbasaur", "medio", "Hierva", 3.5, 100, 200, 1, 200, "Este pokemon es de hierva"),
    Senamon("Charmander", "medio", "Fuego", 3.5, 100, 200, 1, 200, "Este pokemon es de fuego"),
  ];

  //Lista de entrenadores. 
  List<Entrenador> entrenadoresSenamon = [
    Entrenador("Ash Ketchum", "Ash@gmail.com", "00-00-00", 100, 2),
    Entrenador("Brock Harrison", "Brock@gmail.com", "00-00-00", 200, 1),
    Entrenador("Misty Waterflower", "Misty@gmail.com", "00-00-00", 200, 1),
  ];

  // for (int i = 0; i < universoSenamon.length; i++ ) {   //Mostrar lista de senamones
  //   universoSenamon[i].mostrarInformacion();
  // }

  // for (int i = 0; i < entrenadoresSenamon.length; i++ ) {   //Mostrar lista de Entrenadores
  //   entrenadoresSenamon[i].mostrarInformacion();
  // }


  //*******Crear Objetos entrenadores manualmente********
  //Crear entrenador 1
  // String nombre1;
  // print("Cual es el nombre del entrenador 1");
  // nombre1 = stdin.readLineSync()!;
  // Entrenador entrenador1 = Entrenador(nombre1, "jefer.hernandez1@gmail.com", "15-junio-1995", 100, 2);
  // //Crear entrenador 1
  // String nombre2;
  // print("Cual es el nombre del entrenador 2");
  // nombre2 = stdin.readLineSync()!;
  // Entrenador entrenador2 = Entrenador(nombre2, "jefer.hernandez1@gmail.com", "15-junio-1995", 100, 2);

  // for ( var i = 0; i < 3; i++) {
  //   for (int i = 0; i < universoSenamon.length; i++) {
  //     print("Posicion: ${i}");
  //     universoSenamon[i].mostrarInformacion();
  //   }
  //   print("Selecciona tu SENAMON ${i + i}");
  //   int pokemon = int.parse(stdin.readLineSync()!);
  //   entrenador1.agregarSenamon(universoSenamon[posSenamon]);
  // }
  // entrenador1.mostrarInformacion();



  //*******Crear Objetos entrenadores predefinidos******** 
  //Jugador 1: Ash Ketchum.
  Entrenador entrenador1 = Entrenador("Ash Ketchum", "Ash@gmail.com", "00-00-00", 100, 2);
  //jugador1.mostrarInformacion();

  //Jugador 2: Brock Harrison.
  Entrenador entrenador2 = Entrenador("Brock Harrison", "Brock@gmail.com", "00-00-00", 200, 1);
  //jugador2.mostrarInformacion();

  //Jugador 3: Misty Waterflower.
  Entrenador entrenador3 = Entrenador("Misty Waterflower", "Misty@gmail.com", "00-00-00", 200, 1);
  //jugador2.mostrarInformacion();

  //************Pokemones objetos**************** 
  //Pokemon 1: Pikachu
  Senamon senamon1 = Senamon("Pikachu", "medio", "Electrico", 3.5, 100, 200, 1, 200, "Este pokemon es electrico");
  // senamon1.mostrarInformacion();

  //Pokemon 2: Bulbasaur
  Senamon senamon2 = Senamon("Bulbasaur", "medio", "Hierva", 3.5, 100, 200, 1, 200, "Este pokemon es de hierva");
  // senamon2.mostrarInformacion();

  //Pokemon 3: Charmander
  Senamon senamon3 = Senamon("Charmander", "medio", "Fuego", 3.5, 100, 200, 1, 200, "Este pokemon es de fuego");
  // senamon3.mostrarInformacion();

  do {
    print("*" * 60);
    print("Bienvenido a al viedo juego Pokemon seleccione la opcion que desea para jugar.");
    print("1. Duelo a duelo.");
    print("2. Torneo.");
    print("9. Salir.");
    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        do {
        print("*" * 60);
        print("¡ A seleccionado Duelo a Duelo !");
        print("Escoja su Entrenador Senamon:");

        for (int i = 0; i < entrenadoresSenamon.length; i++ ) {   //Mostrar lista de Entrenadores
          print("Entrenador # ${i+1}:");
          entrenadoresSenamon[i].mostrarInformacion();
        }
        print("3. volver atrás.");
        opcion = int.parse(stdin.readLineSync()!);

          switch (opcion) {
            case 1: 
              print("Has seleccionado al entrenador:");
              // print("${entrenadores[0]}");
            break;
            case 2:
            print("Has seleccionado al entrenador:");
              // print("${entrenadores[1]}");
            break;
            case 3:
              print("Hasta pronto");  //revisar por que no se devulve atras y finaliza
            break;
            default:
              print("Error Ingrese opcion # 1 a 5 o opcion # 9 para salir.");
            break;
          }
        }
        while (opcion !=3);
      break;
      case 2:
        print("torneo");
      break;
      case 9:
        print("Hasta la proxima !");
      break;
    }
  }
  while (opcion != 9);

}