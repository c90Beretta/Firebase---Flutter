import 'package:firebase/models/empleado_model.dart';
import 'package:firebase/services/empleado_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmpleadoView extends StatelessWidget {
  const EmpleadoView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Empleado'),
        ),
        body:
        const EmpleadosList(),
        
      ),
    );
  }
}





class EmpleadosList extends StatefulWidget {
  const EmpleadosList({super.key});

  @override
  State<EmpleadosList> createState() => _EmpleadosListState();
}

class _EmpleadosListState extends State<EmpleadosList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Camiones de Gas'),
        backgroundColor: const Color(0xFF4B39EF),
      ),
      body: StreamBuilder<List<EmpleadoModel>>(
        stream:  Provider.of<EmpleadoService>(context,listen: false).getEmpleados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay camiones disponibles'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final empleado = snapshot.data![index];
              return EmpleadoCard(empleado: empleado);
            },
          );
        },
      ),
    );
  }

 
}



 class EmpleadoCard extends StatelessWidget {
  final EmpleadoModel empleado;
    const EmpleadoCard({super.key, required this.empleado});
  
    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }
