import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Database/cach_helper.dart';
import 'package:turn_digital/Core/Routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      bool isOnboardingShow = await CacheHelper.getBool('onboarding');
      bool isLogin = await CacheHelper.getBool('login');
      if (isOnboardingShow) {
        // navigateReplacement(context, const OnboardingScreen());
      } else if (!isLogin) {
        Navigator.pushReplacementNamed(context, AppRoutes.rSignUp);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.rHome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/masked_background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/Turn-Digital-Logo.png'),
        ),
      ),
    );
  }
}
