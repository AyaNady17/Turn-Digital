import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Routing/routes.dart';
import 'package:turn_digital/Features/Home/Presention/View/explore_view.dart';
import 'package:turn_digital/Features/Home/Presention/View/notched_bottom_nav_bar.dart';
import 'package:turn_digital/Features/Home/Presention/View/organizer_screen.dart';
import 'package:turn_digital/Features/SignUp/Presention/View/sign_up_view.dart';
import 'package:turn_digital/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencyInjection();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const TurnDigital());
}

class TurnDigital extends StatelessWidget {
  const TurnDigital({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        //      home: NotchedBottomAppBar(),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRoutes.rSplash,
      ),
    );
  }
}
