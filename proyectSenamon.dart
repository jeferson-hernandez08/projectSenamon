import 'dart:math';
import 'dart:io';
import 'entrenador.dart';
import 'senamon.dart';
import 'batalla.dart';

//Punto 7. Moneda aleatoria
void monedaAleatoria(List<String> moneda) {
  var random = Random();
  // Barajar las listas para asegurarse de que estén en orden aleatorio
  moneda.shuffle(random);
  print(moneda.first);   //Se usa .firts para acceder al primer elemento de la lista de haber sido barajada. Dado que la lista está en un orden aleatorio, este elemento será efectivamente uno aleatorio de la lista.
  
}

Entrenador crearEntrenador() {
  print('Ingrese el nombre del entrenador: ');
  String? nombre = stdin.readLineSync();
  return Entrenador(nombre ?? 'Entrenador', 'email@example.com', DateTime(2000, 1, 1), 0, 0);
}

void main() {
  int opcion;   //Variable para preguntar opción del menú





  do {
    print("***************************************************************************************");
    print("Bienvenido a al viedo juego Pokemon seleccione la opcion que desea para jugar.");
    print("1. Duelo a duelo.");
    print("2. Torneo.");
    print("9. Salir.");
    opcion = int.parse(stdin.readLineSync()!);
    List<String> entrenadores = [  // Lista de emtrenadores
    'ANDRES FELIPE SANCHEZ HURTADO', 'ANGIE DAHIANA RIOS QUINTERO', 'CRISTIAN ALVAREZ ARANZAZU', 
    'DANIEL ESTIVEN ARBOLEDA DUQUE', 'DAVID ANDRES MORALES GUAPACHA', 'DAVID STIVEN OCAMPO LONDOÑO', 
    'ESTEBAN REYES AGUDELO', 'JACOBO GALVIS JIMENEZ', 'JAIME ANDRES CALLE SALAZAR', 'JEFERSON MAURICIO HERNANDEZ LADINO', 
    'JHON ALEXANDER PINEDA OSORIO', 'JOSE MIGUEL SIERRA ARISTIZABAL', 'JOSÉ SEBASTIÁN OCAMPO LÓPEZ', 
    'JUAN ANDRES OSORIO GOMEZ', 'JUAN DIEGO CALVO OSORIO', 'JUAN ESTEBAN LOPEZ CALLE', 
    'JUAN PABLO RIOS ARISTIZABAL', 'MARIA PAULA MELO SOLANO', 'MIGUEL ANGEL PEÑA JIMENEZ', 
    'SAMUEL CASTAÑO CARDONA', 'JUAN JOSÉ POSADA PÉREZ', 'ALEJANDRO SERNA LONDOÑO', 
    'JUAN MANUEL ZULUAGA RINCON', 'JUAN DANIEL GOMEZ LASERNA', 'YERSON STIVEN HERRERA OBANDO', 
    'MATEO HERRERA VARGAS', 'ALEJANDRO VALLEJO ESCOBAR'
  ]; 

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




Entrenador buscarEntrenador() {
  print('Ingrese el nombre del entrenador: ');
  String? nombre = stdin.readLineSync();
  return Entrenador(nombre ?? 'Entrenador', 'email@example.com', DateTime(2000, 1, 1), 0, 0);
}

List<Senamon> crearMundoSenamon() {
  return [
    Senamon(nombre: 'FuegoMon', tipoSenamon: 'Fuego', peso: 5, puntosSalud: 100, nivelAtaque: 20, fase: 'Normal', nivelEnergia: 100, descripcion: 'Descripción FuegoMon', nivel: 1),
    Senamon(nombre: 'AguaMon', tipoSenamon: 'Agua', peso: 5, puntosSalud: 100, nivelAtaque: 20, fase: 'Normal', nivelEnergia: 100, descripcion: 'Descripción AguaMon', nivel: 1),
    Senamon(nombre: 'HierbaMon', tipoSenamon: 'Hierba', peso: 5, puntosSalud: 100, nivelAtaque: 20, fase: 'Normal', nivelEnergia: 100, descripcion: 'Descripción HierbaMon', nivel: 1),
    // Agregar más Senamones según sea necesario
  ];
}

/*List<Senamon> elegirSenamones(List<Senamon> mundoSenamon) {
  List<Senamon> equipo = [];
  for (int i = 0; i < 5; i++) {
    print('Seleccione un Senamon (ingrese el nombre): ');
    String? nombre = stdin.readLineSync();
    Senamon? seleccionado = mundoSenamon.firstWhere(
      (senamon) => senamon.nombre == nombre,
      orElse: () => null,
    );

    if (seleccionado != null) {
      equipo.add(seleccionado);
    } else {
      print('Senamon no encontrado, por favor ingrese un nombre válido.');
      i--;
    }
  }
  return equipo;
}*/
List<Senamon> elegirSenamones(List<Senamon> mundoSenamon) {
  List<Senamon> equipo = [];
  for (int i = 0; i < 5; i++) {
    print('Seleccione un Senamon (ingrese el nombre): ');
    String? nombre = stdin.readLineSync();
    
    // Buscar el Senamon en la lista de mundoSenamon
    Senamon? seleccionado;
    for (var senamon in mundoSenamon) {
      if (senamon.nombre == nombre) {
        seleccionado = senamon;
        break;
      }
    }

    if (seleccionado != null) {
      equipo.add(seleccionado);
    } else {
      print('Senamon no encontrado, por favor ingrese un nombre válido.');
      i--; // Decrementa i para que vuelva a pedir otro Senamon
    }
  }
  return equipo;
}


void entrenarSenamones(Entrenador entrenador) {
  print('Entrenando Senamones para ${entrenador.nombre}...');
  // Aquí iría la lógica para entrenar los Senamones de un entrenador
}