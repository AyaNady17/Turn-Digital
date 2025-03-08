import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Notifications/local_notificatons_services.dart';
import 'package:turn_digital/Core/Routing/routes.dart';
import 'package:turn_digital/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencyInjection();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await NotificationService().initNotifications();

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
