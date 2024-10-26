// import 'package:firebase/providers/gastruck_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/material.dart';

// class GasControlScreen extends ConsumerWidget {
//   const GasControlScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // var gasPercentage = ref.watch(GastruckService().gasPercentageProvider);
//     var gasActive = ref.watch(GastruckService().isActiveProvider);
//     var firestoreDoc = ref.watch(GastruckService().firestoreDocProvider);
//     final formkey = GlobalKey<FormState>();
//     final TextEditingController controller = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF4B39EF),
//         titleTextStyle: const TextStyle(color: Colors.white),
//         title: const Text(
//           'Control de Gas',
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Form(
//                 key: formkey,
//                 child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Porcentaje de Gas',
//                       suffixText: '%',
//                     ),
//                     controller: controller,
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Por favor ingrese un valor';
//                       }
//                       return null;
//                     }),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   const Text('Estado: '),
//                   Switch(
//                     value: gasActive,
//                     onChanged: (value) {
//                       gasActive = value;
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 child: const Text('Guardar Cambios'),
//                 onPressed: () {
//                   //Todo: Implementar la actualización del porcentaje de gas
//                   if (formkey.currentState!.validate()) {
//                     final double v = double.parse(controller.text);
//                     GastruckService().updateGasPercentage(v);
//                   }

//                   //   final double v = value as double;
//                   //  GastruckService().updateGasPercentage(v);
//                 },
//               ),
//               const SizedBox(height: 20),
//               firestoreDoc.when(
//                 data: (doc) =>
//                     Text('Estado actual en Firestore: ${doc.data()}'),
//                 loading: () => const CircularProgressIndicator(),
//                 error: (error, stack) => Text('Error: $error'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
