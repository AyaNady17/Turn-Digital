import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_event_details_response_model.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class OverlayedGoingUserWidget extends StatelessWidget {
  const OverlayedGoingUserWidget({super.key, required this.event});

  final EventDetailsModel event;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 235.h,
      left: 45.w,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/going_users.png", width: 80, height: 35),
            horizontalSpacing(5),
            Text(
              '+${event.numberOfGoing} Going',
              style: AppTextStyles.font15BlackWeight400.copyWith(
                color: AppColorsManager.appPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            horizontalSpacing(40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              //  margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: AppColorsManager.appPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('Invite', style: AppTextStyles.font12WhiteWeight400),
            ),
          ],
        ),
      ),
    );
  }
}
