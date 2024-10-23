import 'package:firebase/Views/Logins/login_screen.dart';
import 'package:firebase/providers/gastrucks_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditGastruck extends StatefulWidget {
  const AddEditGastruck({super.key});

  @override
  State<AddEditGastruck> createState() => _AddEditGastruckState();
}

class _AddEditGastruckState extends State<AddEditGastruck> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _isActiveController = TextEditingController();
  final TextEditingController _tipoDeCamionController = TextEditingController();
  final TextEditingController _cantidadGasController = TextEditingController();
  final TextEditingController _capacidadMaximaController =
      TextEditingController();
  final TextEditingController _nombreConductorController =
      TextEditingController();
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _estadoCamionController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _switchValue = false;
    final gastruckProvider = Provider.of<GastrucksProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF4B39EF),
      appBar: AppBar(
        title: Text('Agregar Gastruck'),
      ),
      body: Center(
        child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  IconButton(
                    iconSize: 40,
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {},
                    icon:
                        Icon(Icons.fire_truck_sharp, color: Color(0xFF4B39EF)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _cantidadGasController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingrese un valor";
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "//todo: add hint ",
                      prefixIcon: const Icon(
                        Icons.gas_meter_rounded,
                        color: Color(0xFF4B39EF),
                      ),
                      labelStyle: DesignConstants.labelStyle,
                      enabledBorder: DesignConstants.enabledBorder,
                      hintStyle: DesignConstants.hintStyle,
                      focusedBorder: DesignConstants.focusedBorder,
                      errorBorder: DesignConstants.errorBorder,
                      focusedErrorBorder: DesignConstants.focusedErrorBorder,
                      contentPadding: DesignConstants.contentPadding,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nombreConductorController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingrese un valor";
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Nombre Conductor ",
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color(0xFF4B39EF),
                      ),
                      labelStyle: DesignConstants.labelStyle,
                      enabledBorder: DesignConstants.enabledBorder,
                      hintStyle: DesignConstants.hintStyle,
                      focusedBorder: DesignConstants.focusedBorder,
                      errorBorder: DesignConstants.errorBorder,
                      focusedErrorBorder: DesignConstants.focusedErrorBorder,
                      contentPadding: DesignConstants.contentPadding,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _placaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingrese un valor";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Placa",
                      prefixIcon: const Icon(
                        Icons.car_repair,
                        color: Color(0xFF4B39EF),
                      ),
                      labelStyle: DesignConstants.labelStyle,
                      enabledBorder: DesignConstants.enabledBorder,
                      hintStyle: DesignConstants.hintStyle,
                      focusedBorder: DesignConstants.focusedBorder,
                      errorBorder: DesignConstants.errorBorder,
                      focusedErrorBorder: DesignConstants.focusedErrorBorder,
                      contentPadding: DesignConstants.contentPadding,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _estadoCamionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingrese un valor";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Estado del Camion",
                      prefixIcon: const Icon(
                        Icons.car_repair,
                        color: Color(0xFF4B39EF),
                      ),
                      labelStyle: DesignConstants.labelStyle,
                      enabledBorder: DesignConstants.enabledBorder,
                      hintStyle: DesignConstants.hintStyle,
                      focusedBorder: DesignConstants.focusedBorder,
                      errorBorder: DesignConstants.errorBorder,
                      focusedErrorBorder: DesignConstants.focusedErrorBorder,
                      contentPadding: DesignConstants.contentPadding,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _tipoDeCamionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingrese un valor";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Tipo de Camion",
                      prefixIcon: const Icon(
                        Icons.car_repair,
                        color: Color(0xFF4B39EF),
                      ),
                      labelStyle: DesignConstants.labelStyle,
                      enabledBorder: DesignConstants.enabledBorder,
                      hintStyle: DesignConstants.hintStyle,
                      focusedBorder: DesignConstants.focusedBorder,
                      errorBorder: DesignConstants.errorBorder,
                      focusedErrorBorder: DesignConstants.focusedErrorBorder,
                      contentPadding: DesignConstants.contentPadding,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _capacidadMaximaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingrese un valor";
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Capacidad Maxima",
                      prefixIcon: const Icon(
                        Icons.car_repair,
                        color: Color(0xFF4B39EF),
                      ),
                      labelStyle: DesignConstants.labelStyle,
                      enabledBorder: DesignConstants.enabledBorder,
                      hintStyle: DesignConstants.hintStyle,
                      focusedBorder: DesignConstants.focusedBorder,
                      errorBorder: DesignConstants.errorBorder,
                      focusedErrorBorder: DesignConstants.focusedErrorBorder,
                      contentPadding: DesignConstants.contentPadding,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Switch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        final capacidadmaximaController =
                            int.parse(_capacidadMaximaController.text);
                        gastruckProvider.saveData(
                          isActive: _switchValue,
                          tipoDeCamion: _tipoDeCamionController.text,
                          cantidadGas: _cantidadGasController.text,
                          capacidadMaxima: capacidadmaximaController,
                          nombreConductor: _nombreConductorController.text,
                          placa: _placaController.text,
                          estadoCamion: _estadoCamionController.text,
                        );
                        showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text('Guardado'),
                              content: const Text('Guardado con exito'),
                              actions: [
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text('Ok'),
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Guardar'),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
