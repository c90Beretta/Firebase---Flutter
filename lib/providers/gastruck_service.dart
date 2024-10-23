// ignore_for_file: unused_element, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/gastruck_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class GastruckService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//? Crear gastruck
  Future<void> createGasTruck(GastruckModel gastruck) async {
    await _firestore.collection('gastrucks').add(gastruck.toJson());
  }

//? Actualizar gastruck
  Future<void> updateGasTruck(GastruckModel gastruck) async {
    await _firestore
        .collection('gastrucks')
        .doc(gastruck.idVehiculo)
        .update(gastruck.toJson());

//? Eliminar gastruck
    Future<void> deleteGasTruck(String idVehiculo) async {
      await _firestore.collection('gastrucks').doc(idVehiculo).delete();
    }

//? Obtener gastruck por id
    Future<GastruckModel> getGasTruckById(String idVehiculo) async {
      final doc =
          await _firestore.collection('gastrucks').doc(idVehiculo).get();
      if (doc.exists) {
        return GastruckModel.fromFirestore(doc.data()!);
      }
      throw Exception('Gastruck no encontrado');
    }

//? Obtener todos los gastrucks
    final firestoreDocProvider = StreamProvider((ref) {
      final objetos =
          FirebaseFirestore.instance.collection('objetos').snapshots();
      //* Mapear la lista de documentos a una lista de objetos
      return objetos
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    });
  }

  // Future<List<GastruckModel>> getAllGasTrucks() async {
  //     final snapshot = await _firestore.collection('gastrucks').get();
  //     return snapshot.docs
  //         .map((doc) => GastruckModel.fromJson(doc.data()))
  //         .toList();
  //   }
  //* Proveedor para el documento de Firestore
  final firestoreDocProvider = StreamProvider<DocumentSnapshot>((ref) {
    var doc = FirebaseFirestore.instance
        .collection('objetos')
        .doc('miObjeto')
        .snapshots();

    print(doc);
    return doc;
  });

  //? Traer GasPorcentaje

// final gasPercentageProvider = StateProvider<double>((ref) => 0.0);
  //? Proveedor para el porcentaje de gas
  final gasPercentageProvider = FutureProvider((ref) async {
    final doc = await FirebaseFirestore.instance
        .collection('objetos')
        .doc('miObjeto')
        .get();
    return doc.data()!['porcentajeGas'] as double;
  });

  //? Actualizar el porcentaje de gas
  void updateGasPercentage(double value) {
    FirebaseFirestore.instance
        .collection('objetos')
        .doc('miObjeto')
        .update({'porcentajeGas': value});
  }

// Proveedor para el estado de activación
  final isActiveProvider = StateProvider<bool>((ref) => false);
}
