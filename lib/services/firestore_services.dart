import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/gastruck_model.dart';

class FirestoreServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Guardar Gastruck;
  Future<void> createGasTruck(Map<String, dynamic> gastruck) async {
    await _firestore.collection('gastrucks').add(gastruck);
  }

  // Traer Gastrucks
  Stream<List<GastruckModel>> getGastrucks() {
    return _firestore.collection('gastrucks').snapshots().map((snapshot) =>
        snapshot.docs
            .map((docs) => GastruckModel.fromFirestore(docs.data()))
            .toList());
  }

  //Traer Gastruck por id
  Stream<GastruckModel> getGastruckById(String idVehiculo) {
    final findDocument = _firestore
        .collection('gastrucks')
        .where('idVehiculo', isEqualTo: idVehiculo)
        .snapshots();

    final gastruck = findDocument.map((snapshot) => snapshot.docs
        .map((docs) => GastruckModel.fromFirestore(docs.data()))
        .first);
    return gastruck;
  }

  // delete Gastruck
  Future<void> deleteGastruck(String idVehiculo) async {
    final findDocument = _firestore.collection('gastrucks').snapshots();
    findDocument.forEach((element) {
      element.docs.forEach((element) {
        if (element.data()['idVehiculo'] == idVehiculo) {
          _firestore.collection('gastrucks').doc(element.id).delete();
        }
      });
    });
  }
}
