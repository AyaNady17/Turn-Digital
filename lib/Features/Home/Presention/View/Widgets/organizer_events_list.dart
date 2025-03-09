import 'package:flutter/material.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_organizer_details_reponse_model.dart';
import 'package:turn_digital/Features/Home/Presention/View/see_all_events_view.dart';

class OrganizerEventsList extends StatelessWidget {
  const OrganizerEventsList({super.key, required this.organizerModel});

  final OrganizerDetailsModel? organizerModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: organizerModel!.events.length,
      itemBuilder: (context, index) {
        final event = organizerModel!.events[index];
        return HorizontalEventCard(
          imageUrl: event.eventPicture,
          dateTime: formatEventDate(event.eventDate),
          title: event.eventName,
        );
      },
    );
  }
}
