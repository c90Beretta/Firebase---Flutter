import 'dart:developer';

import 'package:firebase/models/gastruck_model.dart';
import 'package:firebase/services/firestore_services.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class GastrucksProvider with ChangeNotifier {
  final service = FirestoreServices();
  var uuid = const Uuid();

  String? _idVehiculo;
  bool? _isActive;
  String? _tipoDeCamion;
  String? _cantidadGas;
  int? _capacidadMaxima;
  String? _nombreConductor;
  String? _placa;
  String? _estadoCamion;

  String? get getidVehiculo => _idVehiculo;
  bool? get getisActive => _isActive;
  String? get gettipoDeCamion => _tipoDeCamion;
  String? get getcantidadGas => _cantidadGas;
  int? get getcapacidadMaxima => _capacidadMaxima;
  String? get getnombreConductor => _nombreConductor;
  String? get getplaca => _placa;
  String? get getestadoCamion => _estadoCamion;

  void updateGastruck(GastruckModel gastruck) {
    _idVehiculo = gastruck.idVehiculo;
    _isActive = gastruck.isActive;
    _tipoDeCamion = gastruck.tipoDeCamion;
    _cantidadGas = gastruck.cantidadGas;
    _capacidadMaxima = gastruck.capacidadMaxima;
    _nombreConductor = gastruck.nombreConductor;
    _placa = gastruck.placa;
    _estadoCamion = gastruck.estadoCamion;
    notifyListeners();
  }

  void saveData(
      {required bool isActive,
      required String tipoDeCamion,
      required String cantidadGas,
      required int capacidadMaxima,
      required String nombreConductor,
      required String placa,
      required String estadoCamion}) {
    GastruckModel newGastruck = GastruckModel(
      idVehiculo: uuid.v4(),
      isActive: isActive,
      tipoDeCamion: tipoDeCamion,
      cantidadGas: cantidadGas,
      capacidadMaxima: capacidadMaxima,
      nombreConductor: nombreConductor,
      placa: placa,
      estadoCamion: estadoCamion,
    );
    service.createGasTruck(newGastruck.toJson());
  }

  Stream<List<GastruckModel>> getGastrucks() {
    return service.getGastrucks();
  }
}
