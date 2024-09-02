//Punto 4.   //nombre, nivel, tipo de Senamon: nombre, nivel, tipo de Senamon(fuego, agua, hierva, volador y eléctrico), peso, puntos de salud, nivel de ataque,fase, nivel de energía y una descripción breve del Senamon
class Senamon {
  String nombre;
  int nivel;
  String tipoSenamon;
  double peso;
  int puntosSalud;
  int nivelAtaque;
  String fase;
  int nivelEnergia;
  String descripcion;

  // Constructor: Funcion que se ejecuta cuando se crea un objeto
  Senamon({
    required this.nombre,
    required this.nivel,
    required this.tipoSenamon,
    required this.peso,
    required this.puntosSalud,
    required this.nivelAtaque,
    required this.fase,
    required this.nivelEnergia,
    required this.descripcion,
  });

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
            -------------------------------------
         """);
  }
}