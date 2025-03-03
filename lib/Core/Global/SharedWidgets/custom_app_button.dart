import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';

class CustomAppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  const CustomAppButton({super.key, this.onTap, required this.text});

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
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            horizontalSpacing(40),
            Center(
              child: Text(text, style: AppTextStyles.font16WhiteWeight400),
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
