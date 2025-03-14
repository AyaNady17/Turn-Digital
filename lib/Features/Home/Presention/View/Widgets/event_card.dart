import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Database/Local%20Database%20Models/local_event_model.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Core/Global/Helpers/app_toasts.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/Home/Data/Models/get_events_list_response_model.dart';
import 'package:turn_digital/Features/Home/Presention/View/event_details_screen.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class EventCard extends StatelessWidget {
  final Events event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => getIt.get<HomeCubit>().shareEvent(event),
      child: Container(
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
              color: const Color(0xff505588).withOpacity(0.06),
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 4.h,
                    ),
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
                            color: Color(0xffEB5757),
                          ),
                        ),
                        Text(
                          extractDateParts(event.date).values.first,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffEB5757),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BookmarkComponent(event: event),
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
                Spacer(),
                SetAlarmComponent(event: event),
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
      ),
    );
  }
}

class SetAlarmComponent extends StatelessWidget {
  const SetAlarmComponent({super.key, required this.event});

  final Events event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) => previous.isAlertSet != current.isAlertSet,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            BlocProvider.of<HomeCubit>(context).toggleEventAlert(event: event);
            showSuccess(
              !state.isAlertSet
                  ? 'Event added to alerts'
                  : 'Event removed from alerts',
            );
          },
          child: Icon(
            state.isAlertSet
                ? Icons.add_alert_rounded
                : Icons.add_alert_outlined,
            color: AppColorsManager.appPrimaryColor,
            size: 20.w,
          ),
        );
      },
    );
  }
}

class BookmarkComponent extends StatelessWidget {
  const BookmarkComponent({super.key, required this.event});

  final Events event;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8.h,
      right: 8.w,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen:
            (previous, current) => previous.savedEvents != current.savedEvents,
        builder: (context, state) {
          final isSaved = BlocProvider.of<HomeCubit>(
            context,
          ).isEventSaved(event.eventId);
          return GestureDetector(
            onTap: () async {
              await BlocProvider.of<HomeCubit>(context).toggleSaveEvent(
                event: LocalEvent(
                  eventId: event.eventId,
                  picture: event.picture,
                  date: event.date,
                  title: event.title,
                  address: event.address,
                  numberOfGoing: event.numberOfGoing,
                ),
              );
              await showSuccess(
                isSaved ? 'Event removed from saved' : 'Event saved',
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                isSaved ? Icons.bookmark : Icons.bookmark_border,
                color: Color(0xffEB5757),
                size: 20.w,
              ),
            ),
          );
        },
      ),
    );
  }
}

class EventListView extends StatefulWidget {
  const EventListView({super.key});

  @override
  EventListViewState createState() => EventListViewState();
}

class EventListViewState extends State<EventListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cubit = context.read<HomeCubit>();
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !cubit.state.isLoadingMore &&
        cubit.state.hasMore) {
      cubit.getEvents(page: cubit.state.currentPage + 1, isLoadMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.requestStatus == RequestStatus.loading &&
            state.eventsList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.requestStatus == RequestStatus.failure) {
          return Center(child: Text(state.responseMessage));
        }

        return SizedBox(
          height: 255.h,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: state.eventsList.length + (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == state.eventsList.length) {
                return const SizedBox(
                  width: 50,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: InkWell(
                  child: EventCard(event: state.eventsList[index]),
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => EventDetailsScreen(
                                eventId: state.eventsList[index].eventId,
                              ),
                        ),
                      ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
