import 'package:firebase/infrastructure/gastruck_service.dart';
import 'package:firebase/infrastructure/providers/gasera_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GasControlScreen extends ConsumerWidget {
  const GasControlScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var gasPercentage = ref.watch(GastruckService().porcetanjeProvider);
    var gasActive = ref.watch(GastruckService().isActiveProvider);
    var firestoreDoc = ref.watch(GastruckService().firestoreDocProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B39EF),
        titleTextStyle: const TextStyle(color: Colors.white),
        title: const Text(
          'Control de Gas',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Porcentaje de Gas',
                  suffixText: '%',
                ),
                keyboardType: TextInputType.number,
                initialValue: gasPercentage.toString(),
                onChanged: (value) {
                  //Todo: Implementar la actualización del porcentaje de gas
                },
              ),
              
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('Estado: '),
                  Switch(
                    value: gasActive,
                    onChanged: (value) {
                      gasActive = value;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Guardar Cambios'),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('objetos')
                      .doc('miObjeto')
                      .set({
                    'porcentajeGas': gasPercentage,
                    'activo': gasActive,
                  }, SetOptions(merge: true));
                },
              ),
              const SizedBox(height: 20),
              firestoreDoc.when(
                data: (doc) =>
                    Text('Estado actual en Firestore: ${doc.data()}'),
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
