// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Views/Logins/new_account_view.dart';
import 'package:firebase/Views/home_view.dart';
import 'package:firebase/dominio/user_auth.dart';
import 'package:firebase/services/session_user.dart';
import 'package:firebase/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _userAuth();
  }

  void _userAuth() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        print('Usuario no ha iniciado sesión');
      }  
      else {
              DocumentSnapshot doc = await FirebaseFirestore.instance
              .collection('usuarios')
              .doc(user.uid)
              .get();
  
            final mapUsuario = doc.data() as Map<String, dynamic>;
            final nombre = mapUsuario['nombre'];
            final email = mapUsuario['email'];
            final uid = mapUsuario['uid'];

          
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FadeIn(
                    animate: true,
                    child: Homeview(
                      password: nombre,
                      email: email,
                      uid: uid,
                    ))));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 56, 50, 104),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF4B39EF),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x4D090F13),
                    offset: Offset(
                      0.0,
                      3,
                    ),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 56, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const TodoList()));
                            },
                            child: Image.asset(
                              'assets/Gasera-white.png',
                              height: 160,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Bienvenido de Vuelta!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'Manrope',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const FormFields(),
                    const CreacionCuenta(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormFields extends StatefulWidget {
  const FormFields({
    super.key,
  });

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  final correoController = TextEditingController();
  final passwordController = TextEditingController();
  // ignore: no_leading_underscores_for_local_identifiers
  final formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: correoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su Correo';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Formato de Correo incorrecto';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: const Icon(Icons.email),
                      labelText: 'Correo',
                      labelStyle: DesignConstants.labelStyle,
                      hintText: 'Ingrese su Correo de Usuario...',
                      hintStyle: DesignConstants.hintStyle,
                      enabledBorder: DesignConstants.enabledBorder,
                      focusedBorder: DesignConstants.focusedBorder,
                      errorBorder: DesignConstants.errorBorder,
                      focusedErrorBorder: DesignConstants.focusedErrorBorder,
                      filled: true,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su Contraseña';
                        }
                        if (value.length <= 7) {
                          return 'Su contraseña debe tener al menos 8 caracteres';
                        }
                        return null;
                      },
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Contraseña',
                        hintText: 'Ingrese su Contraseña...',
                        hintStyle: DesignConstants.hintStyle,
                        enabledBorder: DesignConstants.enabledBorder,
                        focusedBorder: DesignConstants.focusedBorder,
                        errorBorder: DesignConstants.errorBorder,
                        focusedErrorBorder: DesignConstants.focusedErrorBorder,
                        filled: true,
                        fillColor: const Color(0xFFE0E0E0),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF090F13),
                        fontSize: 14,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final correo = correoController.text.trim();
                        final password = passwordController.text.trim();
                        acceder(
                            formKey.currentState, correo, password, context);

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => FadeIn(
                        //         animate: true,
                        //         child: Homeview(
                        //           password: correo,
                        //         ))));
                      }
                    },
                    style: const ButtonStyle(
                      textStyle: WidgetStatePropertyAll(
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Color(0xFFFFFFFF)),
                      fixedSize: WidgetStatePropertyAll(Size(250, 50)),
                    ),
                    child: const Text("Ingresar"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreacionCuenta extends StatelessWidget {
  const CreacionCuenta({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Text(
              '¿No Tienes una Cuenta?',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 14,
                fontFamily: 'Manrope',
              ),
            ),
          ),
          TextButton(
            style: const ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Color(0xFFFFFFFF)),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NewAccountView()));
              //? Hacer Pagina de creación de cuenta
            },
            child: const Text('Presione Aqui'),
          ),
        ],
      ),
    );
  }
}

class DesignConstants {
  static const TextStyle labelStyle = TextStyle(
    color: Color(0xFF95A1AC),
    fontSize: 14,
    fontFamily: 'Manrope',
  );

  static const TextStyle hintStyle = TextStyle(
    color: Color(0xFF95A1AC),
    fontSize: 14,
    fontFamily: 'Manrope',
  );

  static OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 0, 0, 0),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 28, 24, 88),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 249, 111, 111),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 249, 111, 111),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static const EdgeInsetsDirectional contentPadding =
      EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24);
}
