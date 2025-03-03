import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Features/SignUp/Presention/View/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencyInjection();
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
        home: SignUpView(),
      ),
    );
  }
}
