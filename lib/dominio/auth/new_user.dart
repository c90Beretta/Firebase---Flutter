import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void registroNuevoUsuario(
    String email, String password, BuildContext context, nombre) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    if (user != null) {
      // Usuario creado exitosamente
      print('Usuario creado: ${user.email}');
      FirebaseFirestore.instance.collection('usuarios').doc(user.uid).set({
        'email': user.email,
        'uid': user.uid,
        'nombre': nombre,
      });
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              Homeview(password: nombre, email: email, uid: user.uid)));
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('Error'),
              content: const Text('El correo ya está en uso.'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('Error'),
              content: Text('Error: ${e.message}'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  } catch (e) {
    print("Error: $e");
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Error'),
            content: const Text('Error desconocido'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
