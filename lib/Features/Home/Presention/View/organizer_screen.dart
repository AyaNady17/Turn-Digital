import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/organizer_about_widget.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/organizer_button_widget.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/organizer_events_list.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/organizer_header_widget.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/organizer_review_list.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';

class OrganizerScreen extends StatelessWidget {
  const OrganizerScreen({super.key, required this.organizerId});
  final int organizerId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => getIt<HomeCubit>()..getOrganizerDetails(organizerId),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen:
            (previous, current) =>
                previous.requestStatusOrganizer !=
                    current.requestStatusOrganizer ||
                previous.organizerModel != current.organizerModel,
        builder: (context, state) {
          final organizerModel = state.organizerModel;
          if (state.requestStatusOrganizer == RequestStatus.loading) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: const Center(child: CircularProgressIndicator()),
            );
          }
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    OrganizerHeader(
                      url: organizerModel!.picture,
                      followers: organizerModel.numberOfFollowers.toString(),
                      following: organizerModel.numberOfFollowing.toString(),
                      name: organizerModel.name,
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        OrganizerButton(
                          text: 'Follow',
                          icon: 'assets/images/add_person_icon.png',
                          color: AppColorsManager.appPrimaryColor,
                        ),
                        SizedBox(width: 10),
                        OrganizerButton(
                          text: 'Message',
                          icon: 'assets/images/message_icon.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const TabBar(
                      labelColor: AppColorsManager.appPrimaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: AppColorsManager.appPrimaryColor,
                      tabs: [
                        Tab(text: 'ABOUT'),
                        Tab(text: 'EVENTS'),
                        Tab(text: 'REVIEWS'),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: TabBarView(
                          children: [
                            OrganizerAbout(organizerModel: organizerModel),
                            OrganizerEventsList(organizerModel: organizerModel),
                            OrganizerReviewList(),
                          ],
                        ),
                      ),
                    ),
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
