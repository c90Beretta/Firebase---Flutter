// ignore_for_file: avoid_print

import 'package:firebase/Views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void acceder(dynamic formkey, correo, password, context) async {
  final form = formkey;
  if (form.validate()) {
    form.save();
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: correo, password: password);
      print('Usuario autenticado');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              Homeview(password: correo, email: correo, uid: user.user!.uid)));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user');
      } else {
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
          },
        );
      }
    }
  }
}
