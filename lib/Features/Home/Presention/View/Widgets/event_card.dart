import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_events_list_response_model.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class Event {
  final String title;
  final String date;
  final String month;
  final String imagePath;
  final String location;
  final int attendeeCount;

  Event({
    required this.title,
    required this.date,
    required this.month,
    required this.imagePath,
    required this.location,
    required this.attendeeCount,
  });
}

class EventCard extends StatelessWidget {
  final Events event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.62,
      height: MediaQuery.sizeOf(context).height * 0.35,
      padding: EdgeInsets.only(
        top: 10.h,
        left: 10.w,
        right: 10.w,
        bottom: 12.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x505588).withOpacity(0.06),
            offset: const Offset(0, 8),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  event.picture,
                  width: double.infinity,
                  height: 135.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Text(
                        extractDateParts(event.date).values.last,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColorsManager.appPrimaryColor,
                        ),
                      ),
                      Text(
                        extractDateParts(event.date).values.first,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColorsManager.appPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.bookmark,
                    color: AppColorsManager.appPrimaryColor,
                    size: 20.w,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            event.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.font18BlackWeight500,
          ),
          verticalSpacing(10),
          Row(
            children: [
              Image.asset(
                'assets/images/going_users.png',
                width: 56.w,
                height: 24.h,
              ),
              horizontalSpacing(10),
              Text(
                "+${event.numberOfGoing} Going",
                style: AppTextStyles.font12WhiteWeight400.copyWith(
                  color: AppColorsManager.appPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          verticalSpacing(8),
          Row(
            children: [
              Icon(Icons.location_on, size: 16.w, color: Colors.grey),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  event.address,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EventListView extends StatelessWidget {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.requestStatus == RequestStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.requestStatus == RequestStatus.failure) {
          return Center(child: Text(state.responseMessage));
        }
        return SizedBox(
          width: double.infinity,
          height: 255.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.eventsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: EventCard(event: state.eventsList[index]),
              );
            },
          ),
        );
      },
    );
  }
}

Map<String, String> extractDateParts(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String month = DateFormat.MMMM().format(
    dateTime,
  ); // Full month name (e.g., March)
  String date = DateFormat.d().format(dateTime); // Day of the month (e.g., 31)

  return {"month": month, "date": date};
}
