import 'package:flutter/material.dart';

class ControlScreenView extends StatelessWidget {
  const ControlScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Control Screen'),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             SlideInRight(child: const ())));
              },
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
