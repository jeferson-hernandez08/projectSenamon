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

  //Lista del mundo senamon.
  List<Senamon> universoSenamon = [
    Senamon("Pikachu", "medio", "Electrico", 3.5, 100, 200, 1, 200, "Este pokemon es electrico"),
    Senamon("Bulbasaur", "medio", "Hierva", 3.5, 100, 200, 1, 200, "Este pokemon es de hierva"),
    Senamon("Charmander", "medio", "Fuego", 3.5, 100, 200, 1, 200, "Este pokemon es de fuego"),
  ];

  for (int i = 0; i < universoSenamon.length; i++ ) {   //Mostrar lista de senamones
    universoSenamon[i].mostrarInformacion();
  }

  //***Jugadores objetos** 
  //Jugador 1: Jeferson.
  Entrenador jugador1 = Entrenador("Jeferson Hernandez", "jefer.hernandez1@gmail.com", "15-junio-1995", 100, 2);
  jugador1.mostrarInformacion();

  //Jugador 2: Andres.
  Entrenador jugador2 = Entrenador("Andres Sanchez", "andres.sanchez@gmail.com", "12-enero-1988", 200, 1);
  jugador2.mostrarInformacion();

  //***Pokemones objetos** 
  //Pokemon 1: Pikachu
  Senamon senamon1 = Senamon("Pikachu", "medio", "Electrico", 3.5, 100, 200, 1, 200, "Este pokemon es electrico");
  // senamon1.mostrarInformacion();

  //Pokemon 2: Bulbasaur
  Senamon senamon2 = Senamon("Bulbasaur", "medio", "Hierva", 3.5, 100, 200, 1, 200, "Este pokemon es de hierva");
  // senamon2.mostrarInformacion();

  //Pokemon 3: Charmander
  Senamon senamon3 = Senamon("Charmander", "medio", "Fuego", 3.5, 100, 200, 1, 200, "Este pokemon es de fuego");
  // senamon3.mostrarInformacion();

}