import 'dart:math';

class Jugador {
  
  //Punto 1 y 2
  //Atributos de jugador 
  String nombre;
  String email;
  String fechaNacimiento;
  double nivelExperiencia;
  int batallasGanadas;

   // Constructor: Funcion que se ejecuta cuando se crea un objeto
  Jugador(this.nombre, this.email, this.fechaNacimiento, this.nivelExperiencia, this.batallasGanadas);

  void entrenarPokemon() {
    if ( nivelExperiencia >= 200 ) {
      print("Has incrementado 20 puntos al pokemon");
    }
    else {
      print("No tiene suficiente experecia para mejorar pokemon");
    }
  }

  void mostrarInformacion() {
    print("""
            El jugador se llama: ${this.nombre}
            Su email es: ${this.email}
            Su fecha de nacimeinto es: ${this.fechaNacimiento}
            Nivel de expericiena: ${this.nivelExperiencia} 
            Batallas ganadas: ${this.batallasGanadas} 
         """);
  }

}

//Punto 4.   //nombre, nivel, tipo de Senamon: nombre, nivel, tipo de Senamon(fuego, agua, hierva, volador y eléctrico), peso, puntos de salud, nivel de ataque,fase, nivel de energía y una descripción breve del Senamon
class Pokemon {
  String nombre;
  String nivel;
  String tipoSenamon;
  double peso;
  double puntosSalud;
  double nivelAtaque;
  int fase;
  double nivelEnergia;
  String descripcion;

  // Constructor: Funcion que se ejecuta cuando se crea un objeto
  Pokemon(this.nombre, this.nivel, this.tipoSenamon, this.peso, this.puntosSalud, this.nivelAtaque, this.fase, this.nivelEnergia, this.descripcion);

  void mostrarInformacion() {
    print("""
            El pokemon se llama: ${this.nombre}
            Nivel: ${this.nivel}
            tipo pokemon: ${this.tipoSenamon}
            peso: ${this.peso} 
            puntos salud: ${this.puntosSalud} 
            Nivel ataque: ${this.nivelAtaque}
            Fase: ${this.fase}
            Nivel de energia: ${nivelEnergia}
            Descripcion: ${this.descripcion} 
         """);
  }
}

void monedaAleatoria(List<String> moneda) {
  var random = Random();
  // Barajar las listas para asegurarse de que estén en orden aleatorio
  moneda.shuffle(random);
  print(moneda.first);   //Se usa .firts para acceder al primer elemento de la lista de haber sido barajada. Dado que la lista está en un orden aleatorio, este elemento será efectivamente uno aleatorio de la lista.
  
}

void main() {
  List<String> moneda = ["cara", "sello"];
  monedaAleatoria(moneda);

  //******Pokemones objetos******* 
  //Jugador 1: Jeferson.
  Jugador jugador1 = Jugador("Jeferson Hernandez", "jefer.hernandez1@gmail.com", "15-junio-1995", 100, 2);
  jugador1.mostrarInformacion();

  //Jugador 2: Andres.
  Jugador jugador2 = Jugador("Andres Sanchez", "andres.sanchez@gmail.com", "12-enero-1988", 200, 1);
  jugador2.mostrarInformacion();

  //******Pokemones objetos******* 
  //Pokemon 1: Pikachu
  Pokemon pokemon1 = Pokemon("Pikachu", "medio", "Electrico", 3.5, 100, 200, 1, 200, "Este pokemon es electrico");
  pokemon1.mostrarInformacion();

  //Pokemon 2: Bulbasaur
  Pokemon pokemon2 = Pokemon("Bulbasaur", "medio", "Hierva", 3.5, 100, 200, 1, 200, "Este pokemon es de hierva");
  pokemon2.mostrarInformacion();

  //Pokemon 3: Charmander
  Pokemon pokemon3 = Pokemon("Charmander", "medio", "Fuego", 3.5, 100, 200, 1, 200, "Este pokemon es de fuego");
  pokemon3.mostrarInformacion();


}
