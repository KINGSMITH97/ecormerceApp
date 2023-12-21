import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ecomerce App')),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Im home and chilling with my bbbboys',
            style: TextStyle(
              fontSize: 18,
              color: Colors.deepPurple,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ],
      ),
    );
  }
}
