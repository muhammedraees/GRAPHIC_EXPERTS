import 'package:flutter/material.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Home Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Client Home Page!'),
      ),
    );
  }
}
