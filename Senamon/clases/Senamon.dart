//Punto 4.   //nombre, nivel, tipo de Senamon: nombre, nivel, tipo de Senamon(fuego, agua, hierva, volador y eléctrico), peso, puntos de salud, nivel de ataque,fase, nivel de energía y una descripción breve del Senamon
class Senamon {
  String _nombre;
  String _nivel;
  String _tipoSenamon;
  double _peso;
  double _puntosSalud;
  double _nivelAtaque;
  int _fase; 
  double _nivelEnergia;
  String _descripcion;

  // Constructor: Funcion que se ejecuta cuando se crea un objeto
  Senamon(this._nombre, this._nivel, this._tipoSenamon, this._peso, this._puntosSalud, this._nivelAtaque, this._fase, this._nivelEnergia, this._descripcion);

  //Setters y Getters.
  String getNombre() {
    return _nombre;
  }

  void setNombre(String nom) {
    _nombre = nom;
  }

  void mostrarInformacion() {
    print("""
            El pokemon se llama: ${this._nombre}
            Nivel: ${this._nivel}
            tipo pokemon: ${this._tipoSenamon}
            peso: ${this._peso} 
            puntos salud: ${this._puntosSalud} 
            Nivel ataque: ${this._nivelAtaque}
            Fase: ${this._fase}
            Nivel de energia: ${_nivelEnergia}
            Descripcion: ${this._descripcion} 
         """);
  }
}