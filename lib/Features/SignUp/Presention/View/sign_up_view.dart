import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Global/SharedWidgets/custom_app_button.dart';
import 'package:turn_digital/Core/Global/SharedWidgets/custom_text_field.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Features/SignUp/Presention/ViewModal/sign_up_cubit.dart';
import 'package:turn_digital/core/Global/theming/color_manager.dart';
import 'package:turn_digital/core/global/Helpers/functions.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => getIt<SignUpCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(toolbarHeight: 0),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/masked_background.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  verticalSpacing(20),
                  Text("Sign up", style: AppTextStyles.font24BlackWeight600),
                  verticalSpacing(20),
                  CustomTextField(
                    hintText: "Full name",
                    prefixIconPath: 'assets/images/Profile.png',
                    controller: getIt<SignUpCubit>().nameController,
                  ),
                  verticalSpacing(10),
                  CustomTextField(
                    hintText: "abc@email.com",
                    prefixIconPath: 'assets/images/Mail.png',
                    controller: getIt<SignUpCubit>().emailController,
                  ),
                  verticalSpacing(10),
                  CustomTextField(
                    hintText: "Your password",
                    prefixIconPath: 'assets/images/Lock.png',
                    obscureText: true,
                    controller: getIt<SignUpCubit>().passwordController,
                  ),
                  verticalSpacing(10),
                  CustomTextField(
                    hintText: "Confirm password",
                    prefixIconPath: 'assets/images/Lock.png',
                    obscureText: true,
                    controller: getIt<SignUpCubit>().confirmPasswordController,
                  ),
                  verticalSpacing(20),
                  CustomAppButton(
                    text: "SIGN UP",
                    onTap: () => getIt<SignUpCubit>().emitSignupStates(),
                  ),
                  verticalSpacing(20),
                  Center(
                    child: Text("OR", style: AppTextStyles.font16GreyWeight500),
                  ),
                  const SizedBox(width: 10),
                  verticalSpacing(20),
                  SocialLoginButton(
                    text: "Login with Google",
                    icon: "assets/images/google.png",
                    onTap: () {},
                  ),
                  verticalSpacing(10),
                  SocialLoginButton(
                    text: "Login with Facebook",
                    icon: "assets/images/google.png",
                    onTap: () {},
                  ),
                  verticalSpacing(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: AppTextStyles.font15BlackWeight400,
                      ),
                      GestureDetector(
                        onTap: () async {},
                        child: Text(
                          " Sign in",
                          style: AppTextStyles.font15BlackWeight400.copyWith(
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

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 273.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD3D4E2).withOpacity(0.25),
              offset: const Offset(15, 0),
              blurRadius: 30,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 24.h),
            horizontalSpacing(10),
            Text(
              text,
              style: AppTextStyles.font16WhiteWeight400.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
