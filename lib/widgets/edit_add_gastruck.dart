import 'package:firebase/Views/Logins/login_screen.dart';
import 'package:firebase/models/gastruck_model.dart';
import 'package:firebase/providers/gastrucks_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditGastruck extends StatefulWidget {
  final String? idVehiculo;
  const AddEditGastruck({super.key, this.idVehiculo});

  @override
  State<AddEditGastruck> createState() => _AddEditGastruckState();
}

class _AddEditGastruckState extends State<AddEditGastruck> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _tipoDeCamionController = TextEditingController();
  final TextEditingController _cantidadGasController = TextEditingController();
  final TextEditingController _capacidadMaximaController =
      TextEditingController();
  final TextEditingController _nombreConductorController =
      TextEditingController();
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _estadoCamionController = TextEditingController();
  bool _switchValue = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gastruckProvider = Provider.of<GastrucksProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF4B39EF),
      appBar: AppBar(
        title: const Text('Agregar Gastruck'),
      ),
      body: SingleChildScrollView(
          child: widget.idVehiculo != null
              ? StreamBuilder(
                  stream: gastruckProvider.getById(widget.idVehiculo!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      final gastruck = snapshot.data as GastruckModel;
                      _tipoDeCamionController.text = gastruck.tipoDeCamion;
                      _cantidadGasController.text = gastruck.cantidadGas;
                      _capacidadMaximaController.text =
                          gastruck.capacidadMaxima.toString();
                      _nombreConductorController.text =
                          gastruck.nombreConductor;
                      _placaController.text = gastruck.placa;
                      _estadoCamionController.text = gastruck.estadoCamion;
                      _switchValue = gastruck.isActive;
                    }
                    return _buildForm(gastruckProvider, context);
                  },
                )
              : _buildForm(gastruckProvider, context)),
    );
  }

  Center _buildForm(GastrucksProvider gastruckProvider, BuildContext context) {
    return Center(
      child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                IconButton(
                  iconSize: 40,
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.fire_truck_sharp,
                      color: Color(0xFF4B39EF)),
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
                    labelText: "Cantidad de Gas",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    helperText: "Cantidad de gas en litros",
                    alignLabelWithHint: true,
                    counterText: "Counter Text",
                    filled: true,
                    fillColor: Colors.white,
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
                      if (widget.idVehiculo != null) {
                        gastruckProvider.updateGastruck(
                          GastruckModel(
                            idVehiculo: widget.idVehiculo!,
                            isActive: _switchValue,
                            tipoDeCamion: _tipoDeCamionController.text,
                            cantidadGas: _cantidadGasController.text,
                            capacidadMaxima:
                                int.parse(_capacidadMaximaController.text),
                            nombreConductor: _nombreConductorController.text,
                            placa: _placaController.text,
                            estadoCamion: _estadoCamionController.text,
                          ),
                        );
                      } else {
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
                      }
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
                                      builder: (context) => const LoginScreen(),
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
                  child: SizedBox(
                      width: 140,
                      child: const Text(
                        'Guardar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      )),
                )
              ],
            ),
          )),
    );
  }
}
