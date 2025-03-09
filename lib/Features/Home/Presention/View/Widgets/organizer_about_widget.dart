import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_organizer_details_reponse_model.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class OrganizerAbout extends StatelessWidget {
  const OrganizerAbout({super.key, required this.organizerModel});

  final OrganizerDetailsModel? organizerModel;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.font15BlackWeight400,
        children: [
          TextSpan(
            text: organizerModel!.about,
            style: AppTextStyles.font15BlackWeight400,
          ),
          TextSpan(
            text: 'Read More',
            style: AppTextStyles.font15BlackWeight400.copyWith(
              color: AppColorsManager.appPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
