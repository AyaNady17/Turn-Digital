import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_event_details_response_model.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/about_event_section_widget.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/event_details_row_widget.dart';
import 'package:turn_digital/Features/Home/Presention/View/organizer_screen.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class EventDetailsBody extends StatelessWidget {
  const EventDetailsBody({super.key, required this.event});

  final EventDetailsModel event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacing(50),
          Text(
            event.title,
            style: AppTextStyles.font15BlackWeight400.copyWith(fontSize: 35),
          ),
          verticalSpacing(22),
          EventDetailsRow(
            icon: 'assets/images/calendar_icon.png',
            title: formatFullDate(event.date),
            subtitle: formatEventTime(event.date),
          ),
          verticalSpacing(22),
          EventDetailsRow(
            icon: 'assets/images/location_icon.png',
            title: event.addressTitle,
            subtitle: event.address,
          ),
          verticalSpacing(22),

          EventDetailsRow(
            url: event.organizer.picture,

            title: event.organizer.name,
            subtitle: 'Organizer',
            textOfButton: 'Follow',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          OrganizerScreen(organizerId: event.organizer.id),
                ),
              );
            },
          ),
          verticalSpacing(22),
          AboutEvent(aboutEvent: event.aboutEvent),
        ],
      ),
    );
  }
}
