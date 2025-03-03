import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Global/SharedWidgets/custom_app_button.dart';
import 'package:turn_digital/Core/Global/SharedWidgets/custom_text_field.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Features/SignUp/Presention/ViewModal/sign_up_cubit.dart';

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(height: 20),
                Text("Sign up", style: AppTextStyles.font24BlackWeight600),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Full name",
                  assetIcon: 'assets/images/Profile.png',
                  controller: getIt<SignUpCubit>().nameController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "abc@email.com",
                  assetIcon: 'assets/images/Mail.png',
                  controller: getIt<SignUpCubit>().emailController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Your password",
                  assetIcon: 'assets/images/Lock.png',
                  isPassword: true,
                  controller: getIt<SignUpCubit>().passwordController,
                ),
                const SizedBox(height: 10),
                const CustomTextField(
                  hintText: "Confirm password",
                  assetIcon: 'assets/images/Lock.png',
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomAppButton(
                  text: "SIGN UP",
                  onTap: () => getIt<SignUpCubit>().emitSignupStates(),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text("OR", style: AppTextStyles.font16GreyWeight500),
                ),
                const SizedBox(width: 10),
                const SizedBox(height: 20),
                SocialLoginButton(
                  text: "Login with Google",
                  icon: "assets/images/google.png",
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                SocialLoginButton(
                  text: "Login with Facebook",
                  icon: "assets/images/google.png",
                  onTap: () {},
                ),
                const SizedBox(height: 20),
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
                          color: Colors.orange,
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
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onTap;

  const SocialLoginButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 273, // Updated width from Figma
        height: 56, // Updated height from Figma
        decoration: BoxDecoration(
          color: Colors.white, // Background color #FFFFFF
          borderRadius: BorderRadius.circular(12), // Radius 12px
          boxShadow: [
            BoxShadow(
              color: const Color(
                0xFFD3D4E2,
              ).withOpacity(0.25), // Shadow color #D3D4E2 with 25% opacity
              offset: const Offset(15, 0), // X: 15, Y: 0
              blurRadius: 30, // Blur: 30
              spreadRadius: 0, // Spread: 0
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 24),
            const SizedBox(width: 10),
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

class MaskedBackground extends StatelessWidget {
  final Widget child;
  final double maskOpacity;

  const MaskedBackground({
    Key? key,
    required this.child,
    this.maskOpacity = 0.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFB9DAFB), // Replace with color 1 from your image
                  Color(0xFF9895EE), // Replace with color 2
                  Color(0xFFC55492), // Replace with color 3
                  Color(0xFFECACAD), // Replace with color 4
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(maskOpacity), // Adjust opacity
          ),
        ),
        child, // Your actual screen content
      ],
    );
  }
}
