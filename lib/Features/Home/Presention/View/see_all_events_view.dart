import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';
import 'package:turn_digital/core/Global/theming/color_manager.dart';

class SeeAllEventsView extends StatelessWidget {
  const SeeAllEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SeeAllEventsViewAppBar(),
              verticalSpacing(16),
              const SeeAllEventsListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class SeeAllEventsViewAppBar extends StatelessWidget {
  const SeeAllEventsViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text(
              'Events',
              style: AppTextStyles.font24BlackWeight600.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/search.png',
              width: 24.w,
              height: 24.h,
              color: Colors.black,
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {
                // TODO: Implement more options functionality
              },
            ),
          ],
        ),
      ],
    );
  }
}

class SeeAllEventsListView extends StatefulWidget {
  const SeeAllEventsListView({super.key});

  @override
  State<SeeAllEventsListView> createState() => _SeeAllEventsListViewState();
}

class _SeeAllEventsListViewState extends State<SeeAllEventsListView> {
  final ScrollController _scrollController = ScrollController();
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<HomeCubit>(context);
    cubit.getEvents(page: cubit.state.currentPage, isLoadMore: false);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !cubit.state.isLoadingMore &&
        cubit.state.hasMore) {
      cubit.getEvents(page: cubit.state.currentPage + 1, isLoadMore: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.requestStatus == RequestStatus.loading &&
            state.eventsList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          controller: _scrollController,
          itemCount: state.eventsList.length + (state.isLoadingMore ? 1 : 0),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          itemBuilder: (context, index) {
            if (index == state.eventsList.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final event = state.eventsList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: HorizontalEventCard(
                imageUrl: event.picture,
                dateTime: formatEventDate(event.date),
                title: event.title,
                location: event.address,
              ),
            );
          },
        );
      },
    );
  }
}

class HorizontalEventCard extends StatelessWidget {
  final String imageUrl;
  final String dateTime;
  final String title;
  final String location;

  const HorizontalEventCard({
    super.key,
    required this.imageUrl,
    required this.dateTime,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 112.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x575C8A).withOpacity(0.06),
            offset: const Offset(0, 10),
            blurRadius: 35,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              imageUrl,
              width: 78.w,
              height: 92.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dateTime,
                  style: AppTextStyles.font13WhiteWeight500.copyWith(
                    color: AppColorsManager.appPrimaryColor,
                  ),
                ),
                verticalSpacing(4),
                Text(
                  title,
                  style: AppTextStyles.font15BlackWeight400.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                ),
                verticalSpacing(4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey, size: 14.w),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        location,
                        style: AppTextStyles.font14GreyWeight400.copyWith(
                          fontSize: 13.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String formatEventDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat("EEE, MMM d • h:mm a").format(dateTime);
}
