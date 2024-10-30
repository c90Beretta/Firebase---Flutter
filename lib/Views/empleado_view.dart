import 'package:firebase/providers/empleado_provider.dart';
import 'package:flutter/material.dart';

class EmpleadoView extends StatelessWidget {
  const EmpleadoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empleado'),
      ),
      body: const Column(
        children: [
          EmpleadosInput(),
        ],
      ),
    );
  }
}

class EmpleadosInput extends StatefulWidget {
  const EmpleadosInput({
    super.key,
  });

  @override
  State<EmpleadosInput> createState() => _EmpleadosInputState();
}

class _EmpleadosInputState extends State<EmpleadosInput> {
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _correoController = TextEditingController();
  final _puestoController = TextEditingController();
  final _folioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Datos Personales',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _apellidoController,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                    prefixIcon: Icon(Icons.person_remove_alt_1_sharp),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un apellido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _telefonoController,
                  decoration: const InputDecoration(
                    labelText: 'Numero de Telefono',
                    prefixIcon: Icon(Icons.phone_android_rounded),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un Numero de Telefono';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _correoController,
                  decoration: const InputDecoration(
                    labelText: 'Correo Electronico',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un Correo Electronico';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Datos Personales',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _puestoController,
                  decoration: const InputDecoration(
                    labelText: 'Puesto',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un nombre';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                TextFormField(
                  controller: _folioController,
                  decoration: const InputDecoration(
                    labelText: 'Folio de Empleado',
                    prefixIcon: Icon(Icons.work),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un Puesto';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                //! Boton de Ingresar Empleado
                TextButton.icon(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color(0xFF4B39EF),
                    ),
                    iconColor: WidgetStatePropertyAll(
                      Color(0xF1F2F5FF),
                    ),
                  ),
                  label: const Text(
                    'Ingresar Empleado',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  icon: const Icon(Icons.group_add),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );

                      EmpleadoProvider().saveData(
                        nombre: _nombreController.text,
                        apellido: _apellidoController.text,
                        folioEmpleado: int.parse(_folioController.text),
                        puesto: _puestoController.text,
                        telefono: _telefonoController.text,
                        correo: _correoController.text,
                      );
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          )),
    );
  }
}
