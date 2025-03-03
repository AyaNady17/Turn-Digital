import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Core/global/Helpers/extensions.dart';
import 'package:turn_digital/core/Global/Helpers/functions.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const CustomTextField(
                hintText: "Full name",
                assetIcon: 'assets/images/Profile.png',
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                hintText: "abc@email.com",
                assetIcon: 'assets/images/Mail.png',
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                hintText: "Your password",
                assetIcon: 'assets/images/Lock.png',
                isPassword: true,
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                hintText: "Confirm password",
                assetIcon: 'assets/images/Lock.png',
                isPassword: true,
              ),
              const SizedBox(height: 20),
              SignUpButton(),
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
                    onTap: () {},
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
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String assetIcon;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.assetIcon,
    this.isPassword = false,
    this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4DFDF), width: 1),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyles.font14GreyWeight400,
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.assetIcon, width: 24, height: 24),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          suffixIcon:
              widget.isPassword
                  ? InkWell(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Image.asset(
                      'assets/images/Hidden.png',
                      width: 24,
                      height: 24,
                    ),
                  ).paddingAll(16)
                  : null,
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35.w),
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: Color(0xFFF27822), // Orange color
        borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Color(
              0x6F7EC9,
            ).withOpacity(0.25), // Shadow color with 25% opacity
            offset: Offset(0, 10), // X: 0, Y: 10
            blurRadius: 35, // Blur 35
            spreadRadius: 0, // Spread 0
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            horizontalSpacing(40),
            Center(
              child: Text("SIGN UP", style: AppTextStyles.font16WhiteWeight400),
            ),
            horizontalSpacing(50),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                width: 30.w,
                height: 30.h,
                child: Icon(Icons.arrow_forward, color: Colors.orange),
              ),
            ),
          ],
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
