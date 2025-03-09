import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class EventDetailsRow extends StatelessWidget {
  const EventDetailsRow({
    super.key,
    this.onPressed,
    this.textOfButton,
    this.icon,
    this.url,
    required this.title,
    required this.subtitle,
  });
  final String? icon;
  final String? url;
  final String title;
  final String subtitle;
  final String? textOfButton;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            padding: icon == null ? null : const EdgeInsets.all(9),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColorsManager.appPrimaryColor.withOpacity(.1),
            ),
            child:
                (icon != null)
                    ? Image.asset(
                      icon!,
                      height: 30,
                      width: 30,
                      color: AppColorsManager.appPrimaryColor,
                      fit: BoxFit.fill,
                    )
                    : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        url!,
                        height: 50,
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                    ),
          ),
          horizontalSpacing(15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.font16GreyWeight500.copyWith(
                  color: AppColorsManager.textColor,
                ),
              ),
              Text(subtitle, style: AppTextStyles.font14GreyWeight400),
            ],
          ),
          const Spacer(),
          if (textOfButton != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColorsManager.appPrimaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                textOfButton!,
                style: AppTextStyles.font12WhiteWeight400.copyWith(
                  color: AppColorsManager.appPrimaryColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
