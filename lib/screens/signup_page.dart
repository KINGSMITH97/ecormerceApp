import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/services/user_auth.dart';
import 'package:flutter_application_1/shared_components/button.dart';
import 'package:flutter_application_1/shared_components/txtfield.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  AuthServices auth = AuthServices();
  bool isSignupButtonClicked = false;

  @override
  void initState() {
    emailController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isPasswordObsecured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: MediaQuery.of(context).size.height * 0.1,
          ),
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
            const Text('Create an account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(height: 18),
            const Text('Username',
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(height: 8),
            TxtField(
              obscureText: false,
              controller: usernameController,
            ),
            const SizedBox(height: 16),
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
            const Text('Phone Number',
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(height: 8),
            TxtField(
              obscureText: false,
              controller: phoneController,
            ),
            const SizedBox(height: 16),
            const Text('Password',
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(height: 8),
            passwordTextField(),
            const SizedBox(height: 32),
            ButtonWidget(
              isLoading: isSignupButtonClicked,
              title: 'Create Account',
              titleColor: Colors.white,
              btColor: Colors.blueAccent.shade700,
              onTap: () {
                if (hasValidatedTextInputs() == true) {
                  register();
                } else {
                  Fluttertoast.showToast(
                    msg: "fields can't be empty",
                    backgroundColor: Colors.red,
                  );
                }
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text(
                    'Login',
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

  bool hasValidatedTextInputs() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        phoneController.text.isEmpty ||
        usernameController.text.isEmpty) {
      return false;
    }
    return true;
  }

  void register() async {
    setState(() {
      isSignupButtonClicked = true;
    });

    var result = await auth.register(
      emailController.text,
      passwordController.text,
    );

    setState(() {
      isSignupButtonClicked = false;
    });
    if (!mounted) {
      return;
    }
    if (result == null) {
      Fluttertoast.showToast(
        msg: 'User not found',
        backgroundColor: Colors.red,
      );
    } else {
      Navigator.pushNamed(context, '/login');
    }
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
          controller: passwordController,
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
