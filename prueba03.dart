void main() {
  List<String> moneda = ["cara", "sello"];
  monedaAleatoria(moneda);

  // 1. Crear los entrenadores
  Entrenador entrenador1 = crearEntrenador();
  Entrenador entrenador2 = crearEntrenador();

  // 2. Generar el mundo de Senamones
  List<Senamon> mundoSenamon = crearMundoSenamon();

  while (true) {
    print('\n--- MENÚ SECUENCIAL ---');

    // 1. Preguntar si desea duelo o batalla
    print('1. ¿Desea duelo o batalla?');
    print('Escriba "duelo" para duelo o "batalla" para batalla: ');
    String? tipo = stdin.readLineSync()?.toLowerCase();

    // Validar que la opción sea válida
    while (tipo != 'duelo' && tipo != 'batalla') {
      print('Por favor, ingrese una opción válida ("duelo" o "batalla"): ');
      tipo = stdin.readLineSync()?.toLowerCase();
    }

    // 2. Seleccionar los entrenadores Senamones
    print('\n--- SELECCIONAR ENTRENADORES ---');
    print('Elija el entrenador 1 por nombre: ');
    entrenador1 = buscarEntrenador();
    print('Elija el entrenador 2 por nombre: ');
    entrenador2 = buscarEntrenador();

    // 3. Seleccionar los 5 Senamones para cada entrenador
    print('\n--- SELECCIONAR SENAMONES ---');
    print('Entrenador ${entrenador1.nombre}, selecciona tus 5 Senamones:');
    entrenador1.equipo = elegirSenamones(mundoSenamon);
    print('Entrenador ${entrenador2.nombre}, selecciona tus 5 Senamones:');
    entrenador2.equipo = elegirSenamones(mundoSenamon);

    // 4. Preguntar si desea mejorar Senamon o iniciar partida
    print('\n--- MEJORAR O INICIAR ---');
    print('¿Desea mejorar un Senamon o iniciar la partida? (escriba "mejorar" o "iniciar"): ');
    String? accion = stdin.readLineSync()?.toLowerCase();

    while (accion != 'mejorar' && accion != 'iniciar') {
      print('Por favor, ingrese una opción válida ("mejorar" o "iniciar"): ');
      accion = stdin.readLineSync()?.toLowerCase();
    }

    if (accion == 'mejorar') {
      // 4a. Mejorar Senamones
      print('\n--- MEJORAR SENAMONES ---');
      entrenarSenamones(entrenador1);
      entrenarSenamones(entrenador2);
    }

    // 4b. Iniciar la batalla o duelo
    if (tipo == 'batalla') {
      Batalla.iniciarBatalla(entrenador1, entrenador2);
    } else if (tipo == 'duelo') {
      // Aquí se puede implementar la lógica específica para el duelo si es diferente de la batalla
      print('\nDuelo no implementado, iniciando batalla por defecto.');
      Batalla.iniciarBatalla(entrenador1, entrenador2);
    }

    // 5. Opción para salir
    print('\n--- OPCIÓN DE SALIR ---');
    print('¿Desea salir del juego? (escriba "si" para salir, cualquier otra tecla para continuar): ');
    String? salir = stdin.readLineSync()?.toLowerCase();

    if (salir == 'si') {
      print('Gracias por jugar. ¡Hasta la próxima!');
      break;
    }
  }
}