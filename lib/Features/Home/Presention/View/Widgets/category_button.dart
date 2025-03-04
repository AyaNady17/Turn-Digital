import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final Color color;
  final String icon;

  const CategoryButton({
    required this.label,
    required this.color,
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.96.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x1F2E2E4F),
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 18.w, height: 18.h),
          SizedBox(width: 6.w),
          Text(
            label,
            style: AppTextStyles.font14GreyWeight400.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
