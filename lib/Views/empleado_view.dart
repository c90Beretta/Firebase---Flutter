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

class EmpleadosInput extends StatelessWidget {
  const EmpleadosInput({
    super.key,
  });

  validator(value) {
    if (value.isEmpty) {
      return 'Por favor ingrese un nombre';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Empleado',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
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
                decoration: const InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una direccion';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Numero de Telefono',
                  icon: Icon(Icons.phone_android_rounded),
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
                  }
                },
              )
            ],
          ),
        ));
  }
}
