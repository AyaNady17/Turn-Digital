import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:turn_digital/Core/Database/shared_prefrences_services.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/SharedWidgets/custom_app_button.dart';
import 'package:turn_digital/Core/Global/SharedWidgets/custom_text_field.dart';
import 'package:turn_digital/Core/Global/app_strings.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/SignUp/Presention/View/sign_up_view.dart';

import '../../../core/routing/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushNamed(context, AppRoutes.rNavBar);
      SharedPreferencesService.setBool(
        SharedPreferencesService.isUserLoggedInKey,
        true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/masked_background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  verticalSpacing(20),
                  Image.asset(
                    'assets/images/Turn-Digital-Logo.png',
                    width: 300.w,
                    height: 62.h,
                  ),
                  verticalSpacing(60),
                  Text(
                    'Sign In',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.font24BlackWeight600,
                  ),
                  verticalSpacing(20),
                  CustomTextField(
                    controller: _emailController,
                    hintText: AppStrings.tEmailHint,
                    prefixIconPath: 'assets/images/Mail.png',
                    validator: (_) {
                      return null;
                    },
                  ),
                  verticalSpacing(15),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: AppStrings.tPasswordHint,
                    prefixIconPath: 'assets/images/Lock.png',
                    isPassword: true,
                    validator: (_) {
                      return null;
                    },
                  ),
                  verticalSpacing(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              activeColor: Colors.white,
                              activeTrackColor:
                                  AppColorsManager.appPrimaryColor,
                              value: true,
                              onChanged: (val) {},
                            ),
                          ),
                          Text(
                            'Remember Me',
                            style: AppTextStyles.font12WhiteWeight400,
                          ),
                        ],
                      ),
                      Text(
                        AppStrings.tForgotPassword,
                        style: AppTextStyles.font12WhiteWeight400.copyWith(
                          color: AppColorsManager.appPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(20),
                  CustomAppButton(text: 'Login', onTap: _login),
                  verticalSpacing(20),
                  Text(
                    'OR',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14GreyWeight400,
                  ),
                  verticalSpacing(20),
                  SocialLoginButton(
                    text: AppStrings.tLoginFacebook,
                    icon: 'assets/images/google.png',
                    onTap: () {},
                  ),
                  verticalSpacing(10),
                  SocialLoginButton(
                    text: AppStrings.tLoginFacebook,
                    onTap: () {},
                    icon: 'assets/images/google.png',
                  ),
                  verticalSpacing(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.tLoginDontAccount),

                      InkWell(
                        onTap:
                            () =>
                                Navigator.pushNamed(context, AppRoutes.rSignUp),
                        child: Text(
                          AppStrings.tSignUp,
                          style: AppTextStyles.font12WhiteWeight400.copyWith(
                            color: AppColorsManager.appPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
