import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';

class CustomAppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final bool isLoading;

  const CustomAppButton({
    super.key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35.w),
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColorsManager.appPrimaryColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xff6F7EC9).withOpacity(0.25),
            offset: Offset(0, 10),
            blurRadius: 35,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextButton(
        onPressed: isLoading ? null : onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!isLoading)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  horizontalSpacing(40),
                  Text(text, style: AppTextStyles.font16WhiteWeight400),
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
            if (isLoading)
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
