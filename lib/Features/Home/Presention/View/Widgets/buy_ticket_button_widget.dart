import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class BuyTicketButton extends StatelessWidget {
  const BuyTicketButton({super.key, required this.eventPrice});
  final String eventPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsManager.appPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadowColor: Colors.grey.withOpacity(0.5),
          elevation: 5,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Center(
          child: Text(
            'BUY TICKET \$$eventPrice',
            style: AppTextStyles.font16WhiteWeight400,
          ),
        ),
      ),
    );
  }
}
