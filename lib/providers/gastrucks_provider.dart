import 'package:firebase/models/gastruck_model.dart';
import 'package:firebase/services/firestore_services.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class GastrucksProvider with ChangeNotifier {
  final service = FirestoreServices();
  var uuid = const Uuid();

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

  void deleteGastruck(String idVehiculo) {
    service.deleteGastruck(idVehiculo);
  }

  Stream<GastruckModel> getById(String idVehiculo) {
    final gastruck = service.getGastruckById(idVehiculo);
    return gastruck;
  }

  //? Actualizar gastruck
  void updateGastruck(GastruckModel gastruck) {
    service.updateGasTruck(gastruck.toJson());
  }
}


//crear nuevo proveedor para el documento de Firestore
// final firestoreDocProvider = StreamProvider<DocumentSnapshot>((ref) {
 