import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Routing/routes.dart';
import 'package:turn_digital/Features/Home/Presention/View/explore_view.dart';
import 'package:turn_digital/Features/Home/Presention/View/notched_bottom_nav_bar.dart';
import 'package:turn_digital/Features/Home/Presention/View/see_all_events_view.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';
import 'package:turn_digital/Features/Login/login_view.dart';
import 'package:turn_digital/Features/OTP/Presention/View/otp_verification_view.dart';
import 'package:turn_digital/Features/SignUp/Presention/View/sign_up_view.dart';
import 'package:turn_digital/Features/Splash/splash.dart';

class AppRouter {
  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.rSplash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case AppRoutes.rOnBoarding:
        return MaterialPageRoute(builder: (_) => Container());
      case AppRoutes.rLogin:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case AppRoutes.rSignUp:
        return MaterialPageRoute(builder: (_) => SignUpView());

      case AppRoutes.rOtp:
        return MaterialPageRoute(builder: (_) => OTPVerificationScreen());
      case AppRoutes.rHome:
        return MaterialPageRoute(builder: (_) => ExploreView());

      case AppRoutes.rSeeAllEvents:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt<HomeCubit>(),
                child: SeeAllEventsView(),
              ),
        );

      case AppRoutes.rNavBar:
        return MaterialPageRoute(builder: (_) => NotchedBottomAppBar());

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
