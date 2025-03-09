import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class AboutEvent extends StatelessWidget {
  const AboutEvent({super.key, required this.aboutEvent});
  final String aboutEvent;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Event', style: AppTextStyles.font18BlackWeight500),
        verticalSpacing(16),
        Text(aboutEvent, style: AppTextStyles.font15BlackWeight400),
      ],
    );
  }
}
