import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final event = state.eventDetails;
            if (state.eventDetailsRequestStatus == RequestStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EventHeader(eventImage: event!.picture),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpacing(40),
                            Text(
                              event.title,
                              style: AppTextStyles.font15BlackWeight400
                                  .copyWith(fontSize: 35),
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
                            ),
                            verticalSpacing(22),
                            AboutEvent(aboutEvent: event.aboutEvent),
                          ],
                        ),
                      ),
                      verticalSpacing(22),
                      BuyTicketButton(eventPrice: event.eventPrice),
                    ],
                  ),
                  Positioned(
                    top: 235.h,
                    left: 45.w,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/going_users.png",
                            width: 80,
                            height: 35,
                          ),
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 6,
                            ),
                            //  margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: AppColorsManager.appPrimaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Invite',
                              style: AppTextStyles.font12WhiteWeight400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

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
          height: 250,
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
            padding: EdgeInsets.all(9),
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
                      height: 50,
                      width: 50,
                      color: AppColorsManager.appPrimaryColor,
                    )
                    : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        url!,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
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
