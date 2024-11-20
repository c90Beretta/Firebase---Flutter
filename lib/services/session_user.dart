

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SessionUser extends ChangeNotifier{

    getUsuario(){
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        print('Usuario no ha iniciado sesión');
      }  
      if (user != null) {
             DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(user.uid)
            .get();

          // final mapUsuario = doc.data() as Map<String, dynamic>;
          // final nombre = mapUsuario['nombre'];
          // final email = mapUsuario['email'];
          // final uid = mapUsuario['uid'];

          notifyListeners();
       
    }
      });
  }}