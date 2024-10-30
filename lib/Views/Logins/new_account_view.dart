import 'package:firebase/dominio/auth/new_user.dart';
import 'package:flutter/material.dart';

class NewAccountView extends StatefulWidget {
  const NewAccountView({super.key});

  @override
  State<NewAccountView> createState() => _NewAccountViewState();
}

class _NewAccountViewState extends State<NewAccountView> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF4B39EF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: sizeHeight * .1,
            ),
            Center(
                child: SizedBox(
              height: sizeHeight * .3,
              child: Column(children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.account_circle_rounded,
                      color: Colors.white,
                      size: sizeHeight * .23,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Bienvenido! Porfavor Ingrese sus datos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sizeHeight * .024,
                  ),
                ),
              ]),
            )),
            SizedBox(
              height: sizeHeight * .03,
            ),
            Container(
              height: sizeHeight * .6,
              width: sizeWidth,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: const FormNewAccount(),
            )
          ],
        ),
      ),
    );
  }
}

class FormNewAccount extends StatefulWidget {
  const FormNewAccount({
    super.key,
  });

  @override
  State<FormNewAccount> createState() => _FormNewAccountState();
}

class _FormNewAccountState extends State<FormNewAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final newAccountformKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Form(
            key: newAccountformKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: sizeHeight * .04,
                ),
                SizedBox(
                  width: sizeWidth * 0.8,
                  //? Name FormField
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Nombre',
                        enabledBorder: DesignConstants.enabledBorder),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un nombre';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: sizeHeight * .02,
                ),
                SizedBox(
                  width: sizeWidth * 0.8,
                  //? Correo FormField
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_rounded),
                        labelText: 'Correo',
                        enabledBorder: DesignConstants.enabledBorder),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un nombre';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: sizeHeight * .02,
                ),
                SizedBox(
                  width: sizeWidth * 0.8,
                  //? Password FormField
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_rounded),
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
                        labelText: 'Contraseña',
                        enabledBorder: DesignConstants.enabledBorder),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un nombre';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: sizeHeight * .02,
                ),
                Container(
                  width: sizeWidth * 0.8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B39EF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    tooltip: "Ingresar",
                    onPressed: () {
                      if (newAccountformKey.currentState!.validate()) {
                        final email = _emailController.text.trim();
                        final password = _passwordController.text.trim();
                        final nombre = _nameController.text.trim();
                        registroNuevoUsuario(email, password, context, nombre);
                      }
                    },
                    icon: const Icon(Icons.arrow_forward),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    iconSize: 50,
                  ),
                )
              ],
            )),
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
      color: Color.fromARGB(255, 0, 0, 0),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 0, 0, 0),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 0, 0, 0),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static const EdgeInsetsDirectional contentPadding =
      EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24);
}
