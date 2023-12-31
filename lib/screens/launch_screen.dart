import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  int? isViewed;

  handleStartScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isViewed = prefs.getInt('isViewed');
  }

  @override
  void initState() {
    handleStartScreen();
    Future.delayed(const Duration(seconds: 2), () {
      if (isViewed != 2) {
        Navigator.pushNamed(context, "/onboarding");
      } else {
        Navigator.pushNamed(context, "/login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppConstants.logoName,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16),
            const Text(
              'ShoplyGh',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
