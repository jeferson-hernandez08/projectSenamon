import 'dart:math';
import 'Entrenador.dart';
import 'Menu.dart';
import 'Senamon.dart';

class Batalla {
  List<Entrenador> _entrenadores;
  List<Entrenador> _entrenadoresCopia;
  int _pocisionEntrenador;
  int _pocisionEnemigo;
  bool _continuar;

  Batalla(this._entrenadores, this._entrenadoresCopia, this._pocisionEntrenador, this._pocisionEnemigo, this._continuar);

  void setEntrenadoresCopia(){
    for (var i = 0; i < _entrenadores.length; i++) {
      Entrenador entrenadorcopia = Entrenador(_entrenadores[i].getNombre(), "", "", 0, 0, []);
      _entrenadoresCopia.add(entrenadorcopia);
    }
  }

  void setCopiaSenamones(){
    for (var i = 0; i < _entrenadoresCopia.length; i++) {
      for (var j = 0; j < _entrenadores[i].senamones.length; j++) {
        Senamon senamonCopia = Senamon(_entrenadores[i].senamones[j].getNombre(), _entrenadores[i].senamones[j].getSalud(), _entrenadores[i].senamones[j].getAtaque(), 0, _entrenadores[i].senamones[j].getTipoSenamon(), "");
        _entrenadoresCopia[i].senamones.add(senamonCopia);
      }
    }
  }
  
  void lanzarMoneda(){
    List<String> CaraSello = ["Cara", "Sello"];
    Random random = Random();
    print("El entrenador ${_entrenadoresCopia[0].getNombre()} ha sido asignado con cara y el entrenador ${_entrenadoresCopia[1].getNombre()} ha sido asignado con sello");
    int elegido = random.nextInt(2);
    print("Ha salido ${CaraSello[elegido]}");
    print("Ha ganado el primer turno ${_entrenadoresCopia[elegido].getNombre()}");
    _pocisionEntrenador = elegido;
    if (_pocisionEntrenador == 0) {
      _pocisionEnemigo = 1;
    }else{
      _pocisionEnemigo = 0;
    }
  }

  void atacar(){
    print("*"*100);
    print("Entrenador: ${_entrenadoresCopia[_pocisionEntrenador].getNombre()}");
    print("Ingrese el Senamon con el que desea atacar");
    for (var i = 0; i < _entrenadoresCopia[_pocisionEntrenador].senamones.length; i++) {
      print("${i + 1}. ${_entrenadoresCopia[_pocisionEntrenador].senamones[i].getNombre()}. Vida: ${_entrenadoresCopia[_pocisionEntrenador].senamones[i].getSalud()}");
    }
    int pocisionSenamon = validarVida(_entrenadoresCopia[_pocisionEntrenador].senamones);
    print("Ingrese el Senamon del enemigo al que desea atacar");
    for (var i = 0; i < _entrenadoresCopia[_pocisionEnemigo].senamones.length; i++) {
      print("${i + 1}. ${_entrenadoresCopia[_pocisionEnemigo].senamones[i].getNombre()}. Vida: ${_entrenadoresCopia[_pocisionEnemigo].senamones[i].getSalud()}");
    }
    int pocisionSenamonEnemigo = validarVida(_entrenadoresCopia[_pocisionEnemigo].senamones);
    _entrenadoresCopia[_pocisionEntrenador].senamones[pocisionSenamon].atacar(_entrenadoresCopia[_pocisionEnemigo].senamones[pocisionSenamonEnemigo]);
  }

  int validarVida(List<Senamon> senamones){
    int posicionSenamon = validarPosicion(senamones) - 1;
    do {
      if (senamones[posicionSenamon].getSalud() == 0) {
        print("El senamon ${senamones[posicionSenamon].getNombre()} está muerto, ingrese otro senamon");
        posicionSenamon = validarPosicion(senamones) - 1;
      }
    } while (senamones[posicionSenamon].getSalud() == 0);
    return posicionSenamon;
  }

  void terminarRonda(){
    int contador = 0;
    for (var i = 0; i < _entrenadoresCopia[_pocisionEnemigo].senamones.length; i++) {
      if (_entrenadoresCopia[_pocisionEnemigo].senamones[i].getSalud() == 0) {
        contador++;
      }
    }
    if (contador >= 3) {
      _continuar = false;
    }else{
      if (_pocisionEntrenador == 0) {
        _pocisionEnemigo = 0;
        _pocisionEntrenador = 1;
      }else{
        _pocisionEnemigo = 1;
        _pocisionEntrenador = 0;
      }
    }
  }

  bool getContinuar(){
    return _continuar;
  }

  int getPosicionEntrenador(){
    return _pocisionEntrenador;
  }

}