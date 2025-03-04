import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/category_button.dart';

class ExploreScreenCustomAppBar extends StatelessWidget {
  const ExploreScreenCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      decoration: BoxDecoration(
        color: AppColorsManager.appPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(33.r),
          bottomRight: Radius.circular(33.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/drawer_icon.png",
                width: 24.w,
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Current Location",
                        style: AppTextStyles.font12WhiteWeight400,
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                  Text(
                    "New York, USA",
                    style: AppTextStyles.font13WhiteWeight500,
                  ),
                ],
              ),
              Image.asset(
                "assets/images/notification_icon.png",
                width: 36.w,
                height: 36.h,
              ),
            ],
          ),
          verticalSpacing(16),
          Row(
            children: [
              Image.asset(
                "assets/images/search.png",
                width: 24.w,
                height: 24.h,
              ),
              horizontalSpacing(4),
              Text(
                "Search...",
                style: AppTextStyles.font12WhiteWeight400.copyWith(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 18.sp,
                ),
              ),
              horizontalSpacing(140),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/filter_icon.png",
                      width: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(width: 4.w),
                    Text("Filters", style: AppTextStyles.font14GreyWeight400),
                  ],
                ),
              ),
            ],
          ),
          verticalSpacing(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryButton(
                label: "Sports",
                color: AppColorsManager.appBurgandyColor,
                icon: "assets/images/sports_icon.png",
              ),
              SizedBox(width: 10.w),
              CategoryButton(
                label: "Music",
                color: AppColorsManager.appBrownColor,
                icon: "assets/images/music_icon.png",
              ),
              SizedBox(width: 10.w),
              CategoryButton(
                label: "Food",
                color: AppColorsManager.doneColor,
                icon: "assets/images/food_icon.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
