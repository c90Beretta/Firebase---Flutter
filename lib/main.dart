import 'package:firebase/Views/Logins/login_screen.dart';
import 'package:firebase/providers/gastrucks_provider.dart';
import 'package:firebase/services/empleado_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: GastrucksProvider()),
        ChangeNotifierProvider.value(value: EmpleadoService()),
        ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-Do List',
        home: LoginScreen(),
      ),
    );
  }
}
