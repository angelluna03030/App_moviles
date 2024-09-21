
class Bookstore {
  int id;
  String titulo;
  String descripcion;
  DateTime fechaPublicacion; // Corrected spelling of "publicacion"
  double precio;

  // Removed "async" keyword in constructor as it's not being used
  Bookstore({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.fechaPublicacion,
    required this.precio,
  }) {
   
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "titulo": titulo, // Corrected property name
      "descripcion": descripcion,
      "fechaPublicacion": fechaPublicacion,
      "precio": precio
    };
  }
  
}
