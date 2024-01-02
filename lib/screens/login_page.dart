import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/services/user_auth.dart';
import 'package:flutter_application_1/shared_components/button.dart';
import 'package:flutter_application_1/shared_components/txtfield.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  AuthServices auth = AuthServices();
  bool isPasswordObsecured = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            TxtField(
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 16),
            const Text('Password',
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(height: 8),
            passwordTextField(),
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
              onTap: () async {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: "Email or password field is empty",
                    toastLength: Toast.LENGTH_LONG,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                } else {
                  auth.login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                  if (mounted) {
                    Navigator.pushNamed(context, '/home');
                  }
                }
              },
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

  Container passwordTextField() {
    return Container(
      height: 60,
      //width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          obscureText: isPasswordObsecured,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPasswordObsecured = !isPasswordObsecured;
                });
              },
              icon: isPasswordObsecured
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
