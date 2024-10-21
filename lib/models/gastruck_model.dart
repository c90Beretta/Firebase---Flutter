class GastruckModel {
  final String idVehiculo;
  final String cantidadGas;
  final bool isActive;

  GastruckModel(
      {required this.idVehiculo,
      required this.cantidadGas,
      required this.isActive});

  Map<String, dynamic> toJson() {
    return {
      'idVehiculo': idVehiculo,
      'cantidadGas': cantidadGas,
      'isActive': isActive,
    };
  }

  factory GastruckModel.fromJson(Map<String, dynamic> json) {
    return GastruckModel(
      idVehiculo: json['idVehiculo'],
      cantidadGas: json['cantidadGas'],
      isActive: json['isActive'],
    );
  }
}
