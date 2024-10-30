import 'package:firebase/Views/home_view.dart';
import 'package:flutter/material.dart';

class EmployeeProfileScreen extends StatelessWidget {
  final String employeeName;
  final String employeePosition;
  final String employeeId;
  final String email;
  final String phoneNumber;

  const EmployeeProfileScreen({
    super.key,
    required this.employeeName,
    required this.employeePosition,
    required this.employeeId,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF4B39EF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Homeview(
                        password: employeeName,
                        email: email,
                        uid: employeeId)));
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => EmployeeProfileScreen(
                //           employeeName: password,
                //           email: email,
                //           employeeId: uid,
                //           employeePosition: "Patron",
                //           phoneNumber: "6622990011",
                //         )));
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
      appBar: AppBar(
        title: const Text('Perfil del Empleado',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF4B39EF),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFF4B39EF),
                child: Text(
                  employeeName.substring(0, 1).toUpperCase(),
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                employeeName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                employeePosition,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              _buildInfoCard('ID de Empleado', employeeId),
              _buildInfoCard('Correo Electrónico', email),
              _buildInfoCard('Número de Teléfono', phoneNumber),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Color(0xFF4B39EF)),
            ),
            const SizedBox(height: 5),
            Text(
              content,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
