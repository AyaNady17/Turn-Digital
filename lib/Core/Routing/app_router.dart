import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Routing/routes.dart';
import 'package:turn_digital/Features/Home/Presention/View/explore_view.dart';
import 'package:turn_digital/Features/OTP/Presention/View/otp_verification_view.dart';
import 'package:turn_digital/Features/SignUp/Presention/View/sign_up_view.dart';

class AppRouter {
  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.rSplash:
        return MaterialPageRoute(builder: (_) => Container());
      case AppRoutes.rOnBoarding:
        return MaterialPageRoute(builder: (_) => Container());
      case AppRoutes.rLogin:
        return MaterialPageRoute(builder: (_) => Container());

      case AppRoutes.rSignUp:
        return MaterialPageRoute(builder: (_) => SignUpView());

      case AppRoutes.rOtp:
        return MaterialPageRoute(builder: (_) => OTPVerificationScreen());
      case AppRoutes.rHome:
        return MaterialPageRoute(builder: (_) => ExploreView());

      default:
        return MaterialPageRoute(builder: (_) => NotFoundView());
    }
  }
}

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Not Found')),
      body: Center(child: Text('Page not found')),
    );
  }
}
