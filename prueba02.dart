import 'dart:io';

void main() {
  int opcion;   //Variable para preguntar opción del menú


  do {
    print("***************************************************************************************");
    print("Bienvenido a al viedo juego Pokemon seleccione la opcion que desea para jugar.");
    print("1. Duelo a duelo.");
    print("2. Torneo.");
    print("9. Salir.");
    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        print("A seleccionado Duelo a Duelo !");
        print("Escoja su entrenador");
        print("1. Duelo a duelo.");
        print("2. Torneo.");
        print("9. Salir.");
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

  












