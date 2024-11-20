import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/empleado_model.dart';
import 'package:flutter/cupertino.dart';

class EmpleadoService extends ChangeNotifier{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveEmpleado(EmpleadoModel empleado) async {
    final emp = empleado.toMap();
    await _firestore.collection('empleados').add(emp);
  }

  Stream<List<EmpleadoModel>> getEmpleados() {
    return _firestore.collection('empleados').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => EmpleadoModel.fromMap(doc.data())).toList());
  }

// delete empleado
  Future<void> deleteEmpleado(String idEmpleado) async {
    await _firestore.collection('empleados').doc(idEmpleado).delete();
  }


  // Stream<List<EmpleadoModel>> getEmpleados(){
  //   return
  // }
}
