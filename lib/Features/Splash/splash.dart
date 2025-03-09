import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Database/shared_prefrences_services.dart';
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
      bool isOnboardingVisited =
          SharedPreferencesService.getBool(
            SharedPreferencesService.isOnboardingVistiedKey,
          ) ??
          false;
      bool isUserLoggedIn =
          SharedPreferencesService.getBool(
            SharedPreferencesService.isUserLoggedInKey,
          ) ??
          false;
      if (!isOnboardingVisited) {
        Navigator.pushReplacementNamed(context, AppRoutes.rOnBoarding);
      } else if (!isUserLoggedIn) {
        Navigator.pushReplacementNamed(context, AppRoutes.rSignUp);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.rOnBoarding);
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
