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

  // delete Gastruck
  Future<void> deleteGastruck(String idVehiculo) async {
    await _firestore.collection('gastrucks').doc(idVehiculo).delete();
  }
}
