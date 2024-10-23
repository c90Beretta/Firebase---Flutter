class GastruckModel {
  final String idVehiculo;
  final bool isActive;
  final String tipoDeCamion;
  final String cantidadGas;
  final int capacidadMaxima;
  final String nombreConductor;
  final String placa;
  final String estadoCamion;

  GastruckModel(
      {required this.tipoDeCamion,
      required this.capacidadMaxima,
      required this.nombreConductor,
      required this.placa,
      required this.estadoCamion,
      required this.idVehiculo,
      required this.cantidadGas,
      required this.isActive});

  Map<String, dynamic> toJson() {
    return {
      'idVehiculo': idVehiculo,
      'isActive': isActive,
      'tipoDeCamion': tipoDeCamion,
      'cantidadGas': cantidadGas,
      'capacidadMaxima': capacidadMaxima,
      'nombreConductor': nombreConductor,
      'placa': placa,
      'estadoCamion': estadoCamion,
    };
  }

  factory GastruckModel.fromFirestore(Map<String, dynamic> json) {
    return GastruckModel(
      idVehiculo: json['idVehiculo'],
      isActive: json['isActive'],
      tipoDeCamion: json['tipoDeCamion'],
      cantidadGas: json['cantidadGas'],
      capacidadMaxima: json['capacidadMaxima'],
      nombreConductor: json['nombreConductor'],
      placa: json['placa'],
      estadoCamion: json['estadoCamion'],
    );
  }
}
