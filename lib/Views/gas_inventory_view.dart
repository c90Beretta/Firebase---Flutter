import 'package:firebase/models/gastruck_model.dart';
import 'package:firebase/providers/gastrucks_provider.dart';
import 'package:firebase/widgets/edit_add_gastruck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GastruckListScreen extends StatelessWidget {
  const GastruckListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Camiones de Gas'),
        backgroundColor: const Color(0xFF4B39EF),
      ),
      body: StreamBuilder<List<GastruckModel>>(
        stream: Provider.of<GastrucksProvider>(context, listen: false)
            .getGastrucks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: const Text('No hay camiones disponibles'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final gastruck = snapshot.data![index];
              return GastruckCard(gastruck: gastruck);
            },
          );
        },
      ),
    );
  }
}

class GastruckCard extends StatelessWidget {
  final GastruckModel gastruck;

  const GastruckCard({Key? key, required this.gastruck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: const Icon(
          Icons.local_shipping,
          color: Color(0xFF4B39EF),
          size: 36,
        ),
        title: Text(
          gastruck.placa,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(gastruck.tipoDeCamion),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Conductor', gastruck.nombreConductor),
                _buildInfoRow(
                    'Capacidad', '${gastruck.capacidadMaxima} litros'),
                _buildInfoRow('Cantidad actual', gastruck.cantidadGas),
                _buildInfoRow('Estado', gastruck.estadoCamion),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: _calculateGasPercentage(gastruck),
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getColorForPercentage(_calculateGasPercentage(gastruck)),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Nivel de gas: ${(_calculateGasPercentage(gastruck) * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => (AddEditGastruck(
                                idVehiculo: gastruck.idVehiculo,
                              )),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit),
                        color: const Color(0xFF4B39EF),
                      ),
                      IconButton(
                        onPressed: () {
                          showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: const Text("Eliminar Camion"),
                                  content: const Text(
                                      "¿Estás seguro de que deseas eliminar este camión?"),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: const Text("Cancelar"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      child: const Text("Eliminar"),
                                      onPressed: () {
                                        Provider.of<GastrucksProvider>(context,
                                                listen: false)
                                            .deleteGastruck(
                                                gastruck.idVehiculo);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  double _calculateGasPercentage(GastruckModel gastruck) {
    return double.parse(gastruck.cantidadGas) / gastruck.capacidadMaxima;
  }

  Color _getColorForPercentage(double percentage) {
    if (percentage > 0.6) return Colors.green;
    if (percentage > 0.3) return Colors.orange;
    return Colors.red;
  }
}
