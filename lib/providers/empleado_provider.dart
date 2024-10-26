import 'package:firebase/models/empleado_model.dart';
import 'package:firebase/services/empleado_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class EmpleadoProvider extends ChangeNotifier {
  String? idVehiculo;
  bool? isActive;
  String? tipoDeCamion;
  String? cantidadGas;
  int? capacidadMaxima;
  String? nombreConductor;
  String? placa;
  String? estadoCamion;

  final empleadoService = EmpleadoService();
  var uuid = const Uuid();

  void saveData(
      {required String nombre,
      required String apellido,
      required int folioEmpleado,
      required String puesto,
      required String telefono,
      required String correo}) {
    EmpleadoModel newEmpleado = EmpleadoModel(
      idEmpleado: uuid.v4(),
      nombre: nombre,
      apellido: apellido,
      folioEmpleado: folioEmpleado,
      puesto: puesto,
      telefono: telefono,
      correo: correo,
    );
    empleadoService.saveEmpleado(newEmpleado);
  }
}
