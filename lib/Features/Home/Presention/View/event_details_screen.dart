import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/buy_ticket_button_widget.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/event_details_body_widget.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/event_details_header_widget.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/overlayed_going_users_widget.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';
import 'package:turn_digital/core/global/Helpers/functions.dart';

class EventDetailsScreen extends StatelessWidget {
  final int eventId;
  const EventDetailsScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>.value(
      value: getIt.get<HomeCubit>()..getEventDetails(eventId),

      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen:
            (previous, current) =>
                previous.eventDetailsRequestStatus !=
                    current.eventDetailsRequestStatus ||
                previous.eventDetails != current.eventDetails,
        builder: (context, state) {
          final event = state.eventDetails;
          if (state.eventDetailsRequestStatus == RequestStatus.loading) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: const Center(child: CircularProgressIndicator()),
            );
          }
          return GestureDetector(
            onLongPress: () => getIt.get<HomeCubit>().shareEvent(event),
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EventHeader(eventImage: event!.picture),
                        EventDetailsBody(event: event),
                        verticalSpacing(22),
                        BuyTicketButton(eventPrice: event.eventPrice),
                      ],
                    ),
                    OverlayedGoingUserWidget(event: event),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
