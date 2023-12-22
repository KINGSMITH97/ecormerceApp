import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/shared_components/button.dart';
import 'package:flutter_application_1/shared_components/txtfield.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(
                AppConstants.logoName,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 8),
              const Text(
                'ShoplyGH',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
            const SizedBox(height: 24),
            const Text('Login to your account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(height: 18),
            const Text('Email',
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(height: 8),
            const TxtField(),
            const SizedBox(height: 16),
            const Text('Password',
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(height: 8),
            const TxtField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent.shade700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              title: 'Login',
              titleColor: Colors.white,
              btColor: Colors.blueAccent.shade700,
              onTap: () {},
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
