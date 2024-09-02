import 'dart:math';
import 'entrenador.dart';
import 'senamon.dart';

class Batalla {
  static void iniciarBatalla(Entrenador entrenador1, Entrenador entrenador2) {
    var random = Random();
    var empiezaPrimero = random.nextBool() ? entrenador1 : entrenador2;
    print('${empiezaPrimero.nombre} empieza primero.');

    Senamon? senamon1 = elegirSenamon(empiezaPrimero);
    Senamon? senamon2 = elegirSenamon(empiezaPrimero == entrenador1 ? entrenador2 : entrenador1);

    if (senamon1 != null && senamon2 != null) {
      ejecutarBatalla(senamon1, senamon2);
    }
  }

  static Senamon? elegirSenamon(Entrenador entrenador) {
    print('${entrenador.nombre}, elige un Senamon para la batalla:');
    entrenador.mostrarEquipo();
    return entrenador.equipo.isNotEmpty ? entrenador.equipo.first : null;
  }

  static void ejecutarBatalla(Senamon senamon1, Senamon senamon2) {
    print('¡Empieza la batalla entre ${senamon1.nombre} y ${senamon2.nombre}!');

    while (senamon1.puntosSalud > 0 && senamon2.puntosSalud > 0) {
      int danio1 = calcularDanio(senamon1, senamon2);
      senamon2.puntosSalud -= danio1;
      print('${senamon1.nombre} ataca a ${senamon2.nombre}, causando daño1 puntos de daño.');
      if (senamon2.puntosSalud <= 0) break;

      int danio2 = calcularDanio(senamon2, senamon1);
      senamon1.puntosSalud -= danio2;
      print('${senamon2.nombre} ataca a ${senamon1.nombre}, causando daño2 puntos de daño.');
    }

    if (senamon1.puntosSalud > 0) {
      print('${senamon1.nombre} ha ganado la batalla!');
    } else {
      print('${senamon2.nombre} ha ganado la batalla!');
    }
  }

  static int calcularDanio(Senamon atacante, Senamon defensor) {
    double efectividad = obtenerEfectividad(atacante.tipoSenamon, defensor.tipoSenamon);
    return (atacante.nivelAtaque * efectividad).toInt();
  }

  static double obtenerEfectividad(String tipoAtacante, String tipoDefensor) {
    if (tipoAtacante == 'Fuego' && tipoDefensor == 'Hierba') {
      return 2.0; // Super efectivo
    } else if (tipoAtacante == 'Fuego' && tipoDefensor == 'Agua') {
      return 0.5; // Poco efectivo
    } else if (tipoAtacante == 'Fuego' && tipoDefensor == 'Fuego') {
      return 1.0; // Normal
    } else if (tipoAtacante == 'Agua' && tipoDefensor == 'Fuego') {
      return 2.0; // Super efectivo
    } else if (tipoAtacante == 'Agua' && tipoDefensor == 'Hierba') {
      return 0.5; // Poco efectivo
    } else if (tipoAtacante == 'Agua' && tipoDefensor == 'Agua') {
      return 1.0; // Normal
    } else if (tipoAtacante == 'Hierba' && tipoDefensor == 'Agua') {
      return 2.0; // Super efectivo
    } else if (tipoAtacante == 'Hierba' && tipoDefensor == 'Fuego') {
      return 0.5; // Poco efectivo
    } else if (tipoAtacante == 'Hierba' && tipoDefensor == 'Hierba') {
      return 1.0; // Normal
    } else if (tipoAtacante == 'Volador' && tipoDefensor == 'Hierba') {
      return 2.0; // Super efectivo
    } else if (tipoAtacante == 'Volador' && tipoDefensor == 'Eléctrico') {
      return 0.5; // Poco efectivo
    } else if (tipoAtacante == 'Volador' && tipoDefensor == 'Volador') {
      return 1.0; // Normal
    } else if (tipoAtacante == 'Eléctrico' && tipoDefensor == 'Volador') {
      return 2.0; // Super efectivo
    } else if (tipoAtacante == 'Eléctrico' && tipoDefensor == 'Hierba') {
      return 1.0; // Normal
    } else if (tipoAtacante == 'Eléctrico' && tipoDefensor == 'Eléctrico') {
      return 1.0; // Normal
    } else {
      return 1.0; // En caso de tipos no previstos, se considera normal
    }
  }
}