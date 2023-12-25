import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared_components/button.dart';
import 'package:lottie/lottie.dart';

class SignupCompleted extends StatelessWidget {
  const SignupCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset('assets/images/completed.json'),
            const SizedBox(height: 16),
            const Text(
              "Hurray!!!. Account created successfully",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ButtonWidget(
                title: "Continue",
                titleColor: Colors.white,
                btColor: Colors.blueAccent.shade700,
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
