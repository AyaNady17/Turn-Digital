import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({super.key, required this.eventImage});
  final String eventImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://flashbackfestival.bassevents.be/img/3/55154-24541-10-ae5662532840352e.jpg",
          width: double.infinity,
          height: 250.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 20.h,
          left: 16.w,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                'Event Details',
                style: AppTextStyles.font18BlackWeight500.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
