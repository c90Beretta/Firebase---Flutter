import 'package:firebase/Views/Logins/login_screen.dart';
import 'package:firebase/Views/empleado_view.dart';
import 'package:firebase/Views/gas_inventory_view.dart';
import 'package:firebase/Views/profile/profile_view.dart';
import 'package:firebase/widgets/edit_add_gastruck.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  final String uid;
  final String email;
  final String password;
  const Homeview(
      {super.key,
      required this.password,
      required this.uid,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
      
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFF4B39EF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => ()));
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EmployeeProfileScreen(
                            employeeName: password,
                            email: email,
                            employeeId: uid,
                            employeePosition: "Patron",
                            phoneNumber: "6622990011",
                          )));
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Cerrar Sesión'),
                        content: const Text('¿Estás seguro de cerrar sesión?'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoDialogAction(
                            child: const Text('Cerrar Sesión'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF4B39EF),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeInput(
                correo: password,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeInput extends StatelessWidget {
  final String correo;
  const HomeInput({super.key, required this.correo});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
            child: TextButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xFF4B39EF)),
                ),
                onPressed: () {},
                child: Text(
                  textAlign: TextAlign.center,
                  "Bienvenido Usuario: $correo",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                )),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GastruckListScreen()));
                },
                child: Container(
                  width: sizeWidth * 0.36,
                  height: sizeWidth * 0.36,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B39EF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          Icons.gas_meter_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      Text(
                        'Inventario de Gas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EmpleadoView()));
                  },
                  child: Container(
                    width: sizeWidth * 0.36,
                    height: sizeWidth * 0.36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4B39EF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            'Empleados',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
        const PorcentualGasera(
          imageurl: "assets/yellow.png",
          text: "65%",
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF4B39EF)),
                ),
                onPressed: (){}, 
                child: const Text("Nueva Pipa", style: TextStyle(color: Colors.white),),),
                const SizedBox(width: 10,),
              
              ],


          ),
        )

      ],
    );
  }
}

class PorcentualGasera extends StatelessWidget {
  final String imageurl;
  final String text;
  const PorcentualGasera({
    super.key,
    required this.text,
    required this.imageurl,
  });

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          width: sizeWidth * 0.8,
          height: sizeHeight * 0.1,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Mi Gasera Actual:",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: sizeWidth * 0.8,
            height: sizeHeight * 0.4,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 60, 54, 119),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(151, 54, 44, 142),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddEditGastruck()));
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      imageurl,
                      fit: BoxFit.fill,
                      height: sizeHeight * 0.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
