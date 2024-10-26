import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/empleado_model.dart';

class EmpleadoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveEmpleado(EmpleadoModel empleado) async {
    final emp = empleado.toMap();
    await _firestore.collection('empleados').add(emp);
  }

  // Stream<List<EmpleadoModel>> getEmpleados(){
  //   return
  // }
}
