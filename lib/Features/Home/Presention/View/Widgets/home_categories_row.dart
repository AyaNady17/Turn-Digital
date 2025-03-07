import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart'
    show AppColorsManager;
import 'package:turn_digital/Features/Home/Presention/View/Widgets/category_button.dart';

class HomeCategoriesRow extends StatelessWidget {
  const HomeCategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
