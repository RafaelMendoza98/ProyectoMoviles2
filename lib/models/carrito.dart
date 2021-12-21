class Carrito {
  String Nombre;
  String Precio;

  Carrito({
    required this.Nombre, 
    required this.Precio
    });
  factory Carrito.fromJson(Map<String, dynamic> json) =>
      Carrito(Nombre: json['nombre'], Precio: json['precio']);
}
