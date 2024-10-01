import 'dart:io';
import 'clases/Entrenador.dart';
import 'clases/Menu.dart';
import 'clases/Senamon.dart';

void main(List<String> args) {
  List<Senamon> universoSenamon = [

    Senamon("Charmander", 140, 12, 1, "fuego", "Pokemon de fuego pequeño"),
    Senamon("Vulpix", 150, 14, 1, "fuego", "Pokemon de fuego con seis colas"),
    Senamon("Growlithe", 170, 18, 2, "fuego", "Pokemon de fuego y leal"),
    Senamon("Ponyta", 190, 22, 3, "fuego", "Pokemon de fuego veloz"),
    Senamon("Arcanine", 230, 28, 4, "fuego", "Pokemon de fuego fuerte y majestuoso"),
    Senamon("Squirtle", 130, 11, 1, "agua", "Pokemon de agua pequeño"),
    Senamon("Psyduck", 160, 13, 1, "agua", "Pokemon de agua con problemas de cabeza"),
    Senamon("Horsea", 180, 17, 2, "agua", "Pokemon de agua rápido"),
    Senamon("Starmie", 200, 23, 3, "agua", "Pokemon de agua con forma de estrella"),
    Senamon("Blastoise", 240, 30, 4, "agua", "Pokemon de agua con gran caparazón"),
    Senamon("Bulbasaur", 130, 12, 1, "hierva", "Pokemon de planta y veneno"),
    Senamon("Oddish", 140, 13, 1, "hierva", "Pokemon de planta pequeña"),
    Senamon("Gloom", 160, 16, 2, "hierva", "Pokemon de planta y veneno"),
    Senamon("Weepinbell", 190, 22, 3, "hierva", "Pokemon de planta que cuelga de árboles"),
    Senamon("Venusaur", 230, 28, 4, "hierva", "Pokemon de planta y veneno masivo"),
    Senamon("Pidgey", 120, 10, 1, "volador", "Pokemon de ave pequeño"),
    Senamon("Spearow", 130, 12, 1, "volador", "Pokemon de ave agresivo"),
    Senamon("Zubat", 160, 17, 2, "volador", "Pokemon de tipo volador y venenoso"),
    Senamon("Fearow", 190, 21, 3, "volador", "Pokemon de ave grande y veloz"),
    Senamon("Pidgeot", 220, 26, 4, "volador", "Pokemon volador majestuoso"),
    Senamon("Pikachu", 140, 12, 1, "eléctrico", "Pokemon de electricidad pequeño"),
    Senamon("Magnemite", 150, 14, 1, "eléctrico", "Pokemon de electricidad y metal"),
    Senamon("Voltorb", 160, 16, 2, "eléctrico", "Pokemon con forma de esfera"),
    Senamon("Electabuzz", 190, 22, 3, "eléctrico", "Pokemon de electricidad feroz"),
    Senamon("Raichu", 230, 28, 4, "eléctrico", "Evolución eléctrica avanzada de Pikachu"),

  ];

  List<Entrenador> entrenadores = [];

  //Creación de los entrenadores predeterminados
  Entrenador entrenador1 = Entrenador("Ash Ketchum", "ash@gmail.com", "15-06-1995", 200, 0, []);
  Entrenador entrenador2 = Entrenador("Brock Harrison", "brock@gmail.com", "19-11-1986", 200, 0, []);

  //Inicio
  print("MUNDO SENAMON");
  print("_"*100);
  print("¿Quiere usar los entrenadores predeterminados o quiere crear los entrenadores desde cero?");
  print("Sí[s], No[n]");
  String tipoEntrenador = stdin.readLineSync()!;
  tipoEntrenador = tipoEntrenador.toLowerCase();
  do {
    if (tipoEntrenador != "s" && tipoEntrenador != "n") {
      print("Ingrese una opción correcta (s o n)");
      tipoEntrenador = stdin.readLineSync()!;
    }
  } while (tipoEntrenador != "s" && tipoEntrenador != "n");
  if (tipoEntrenador == "s") {
    entrenadores.add(entrenador1);
    entrenadores.add(entrenador2);
  }else{
    for (var i = 0; i < 2; i++) {
      print("*"*100);
      print("ENTRENADOR #${i + 1}");
      print("*"*100);
      print("ingrese el nombre del entrenador");
      String nombre = stdin.readLineSync()!;
      print("Ingrese el email del entrenador");
      String email = stdin.readLineSync()!;
      print("Ingrese la fecha de nacimiento del entrenador");
      String fecha = stdin.readLineSync()!;
      Entrenador entrenador = Entrenador(nombre, email, fecha, 200, 0, []);
      entrenadores.add(entrenador);
    }
  }

  //Elección de los senamones
  print("*"*100);
  print("Ahora se eligirán los senamones de cada entrenador");
  for (var i = 0; i < 5; i++) {
    for (var j = 0; j < 2; j++) {
      print("Elija el número del senamon número ${i + 1} del entrenador ${entrenadores[j].getNombre()}");
      for (var k = 0; k < universoSenamon.length; k++) {
        print("${k + 1}. ${universoSenamon[k].getNombre()}");
      }
      print("Ingrese el número de senamon que desea elegir");
      int posicionSenamon = validarPosicion(universoSenamon);
      entrenadores[j].senamones.add(universoSenamon[posicionSenamon - 1]);
      universoSenamon.removeAt(posicionSenamon - 1);
      print("*"*100);
    }
  }
  print("*"*100);
  print("los entrenadores quedaron registrados exitosamente al universon senamon, con los siguientes datos:\n");
  for (var i = 0; i < entrenadores.length; i++) {
    entrenadores[i].mostrarInfo();
    print("-"*100);
  }

  //MENÚ SENAMON
  /*
  1. Ver información de un entrenador
  2. Entrenar senamon
  3. Crear nuevo senamon
  4. cambiar senamones elegidos
  5. ver información de un senamon
  6. Batalla
  7. Salir
  */
  int opcion;
  //Se inicializa la clase menú para usar sus métodos
  Menu menu = Menu(0);
  do {
    print("#"*100);
    print("MENÚ SENAMON");
    menu.elegirEntrenador(entrenadores);
    print("""
1. Ver información de un entrenador
2. Entrenar senamon
3. Crear nuevo senamon
4. cambiar senamones elegidos
5. ver información de un senamon
6. Batalla
7. Salir
""");
  opcion = int.parse(stdin.readLineSync()!);
  print("*"*100);
  switch(opcion){
    case 1:
      menu.mostrarInfoEntrenador(entrenadores);
      break;
    
    case 2:
      menu.entrenarSenamon(entrenadores);
      break;

    case 3:
      menu.crearSenamon(entrenadores, universoSenamon);
      break;

    case 4:
      menu.cambiarSenamonesElegidos(entrenadores, universoSenamon);
      break;

    case 5:
      menu.mostrarInfoSenamones(entrenadores, universoSenamon);
      break;

    case 6:
      menu.batalla(entrenadores);
      break;

    case 7:
      print("Espero que le haya gustado el universo Senamon, saliendo...");
      break;

    default:
      print("Ingrese una opción correcta");
      break;
  }
  } while (opcion != 7);
}