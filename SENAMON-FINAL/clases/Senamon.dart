import 'dart:io';

class Senamon {
  String _nombre;
  int _salud;
  int _ataque;
  int _nivel;
  String _tipoSenamon;
  String _descripcion;

  Senamon(this._nombre, this._salud, this._ataque, this._nivel, this._tipoSenamon, this._descripcion);

  String getNombre(){
    return _nombre;
  }

  int getSalud(){
    return _salud;
  }

  int getAtaque(){
    return _ataque;
  }

  String getTipoSenamon(){
    return _tipoSenamon;
  }

  void setSalud(int newSalud){
    _salud = newSalud;
  }

  void subirNivel(){
    int puntos = 20;
    print("Puntos disponibles: $puntos");
    print("Ingrese el número de puntos que desea agregar a la salud de $_nombre");
    int salud = validarRango(puntos, 0);
    _salud += salud;
    puntos -= salud;
    print("Ingrese el número de puntos que desea agregar al ataque de $_nombre");
    int ataque = validarRango(puntos, 0);
    _ataque += ataque;
    puntos -= ataque;
    print("El senamon: $_nombre ha quedado con una salud de $_salud y con un ataque de: $_ataque");
    _nivel++;
  }

  void mostrarInfo(){
    print("""
Nombre: $_nombre
Salud: $_salud
Ataque: $_ataque
Nivel: $_nivel
Tipo de Senamon: $_tipoSenamon
Descripción:
  $_descripcion
""");
  }

  void atacar(Senamon senamonEnemigo){
    senamonEnemigo.setSalud(senamonEnemigo.getSalud() - _ataque);
    if (senamonEnemigo.getSalud() < 0) {
      senamonEnemigo.setSalud(0);
    }
    print("El senamon enemigo ${senamonEnemigo.getNombre()} ha quedado con una vida de: ${senamonEnemigo.getSalud()}");
  }
}

int validarRango(int max, int min){
  int numero;
  numero = int.parse(stdin.readLineSync()!);
  do {
    if (numero < min || numero > max) {
      print("Ingrese un número entre el rango [$min, $max]");
      numero = int.parse(stdin.readLineSync()!);
    }
  } while (numero < min || numero > max);
  return numero;
}