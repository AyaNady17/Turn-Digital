import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class OrganizerButton extends StatelessWidget {
  const OrganizerButton({
    super.key,
    required this.text,
    required this.icon,
    this.color,
  });
  final String text;
  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColorsManager.appPrimaryColor),
          color: color ?? Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              color:
                  color == AppColorsManager.appPrimaryColor
                      ? Colors.white
                      : AppColorsManager.appPrimaryColor,
              height: 22,
              width: 22,
            ),
            horizontalSpacing(10),
            Text(
              text,
              style: AppTextStyles.font14GreyWeight400.copyWith(
                color:
                    color == AppColorsManager.appPrimaryColor
                        ? Colors.white
                        : AppColorsManager.appPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
