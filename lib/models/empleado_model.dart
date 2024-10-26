class EmpleadoModel {
  String idEmpleado;
  String nombre;
  String apellido;
  int folioEmpleado;
  String puesto;
  String telefono;
  String correo;

  EmpleadoModel({
    required this.idEmpleado,
    required this.nombre,
    required this.apellido,
    required this.folioEmpleado,
    required this.puesto,
    required this.telefono,
    required this.correo,
  });

  Map<String, dynamic> toMap() {
    return {
      'idEmpleado': idEmpleado,
      'nombre': nombre,
      'apellido': apellido,
      'folioEmpleado': folioEmpleado,
      'puesto': puesto,
      'telefono': telefono,
      'correo': correo,
    };
  }

  factory EmpleadoModel.fromMap(Map<String, dynamic> map) {
    return EmpleadoModel(
      idEmpleado: map['idEmpleado'],
      nombre: map['nombre'],
      apellido: map['apellido'],
      folioEmpleado: map['folioEmpleado'],
      puesto: map['puesto'],
      telefono: map['telefono'],
      correo: map['correo'],
    );
  }
}
