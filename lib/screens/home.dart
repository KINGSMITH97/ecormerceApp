import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecomerce App')
      ),
      body: const Center(child: Text('Im home', style: TextStyle(
        fontSize: 20,
      )),
      ),
    );
  }
} 