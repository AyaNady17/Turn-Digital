import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';

class OrganizerScreen extends StatefulWidget {
  const OrganizerScreen({super.key});

  @override
  State<OrganizerScreen> createState() => _OrganizerScreenState();
}

class _OrganizerScreenState extends State<OrganizerScreen> {
  final int organizerId = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create:
          (context) =>
              context.read<HomeCubit>()
                ..emitOrganizerDetails(organizerId: organizerId),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final organizerModel = state.organizerModel;
          if (state.requestStatusOrganizer == RequestStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
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
                          icon: Icons.person_add_alt,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 10),
                        OrganizerButton(text: 'Message', icon: Icons.message),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const TabBar(
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.blue,
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
                            Text(organizerModel.about),
                            const Center(child: Text("Events List")),
                            const Center(child: Text("Reviews List")),
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

class OrganizerHeader extends StatelessWidget {
  const OrganizerHeader({
    super.key,
    required this.url,
    required this.followers,
    required this.following,
    required this.name,
  });
  final String url;
  final String followers;
  final String following;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: SizedBox.expand(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: url,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        verticalSpacing(20),
        Text(name, style: AppTextStyles.font18BlackWeight500),
        verticalSpacing(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(following, style: AppTextStyles.font18BlackWeight500),
                Text('Following', style: AppTextStyles.font14GreyWeight400),
              ],
            ),
            SizedBox(
              height: 20,
              child: VerticalDivider(color: AppColorsManager.appLightGreyColor),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(followers, style: AppTextStyles.font18BlackWeight500),
                Text('Followers', style: AppTextStyles.font14GreyWeight400),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class OrganizerButton extends StatelessWidget {
  const OrganizerButton({
    super.key,
    required this.text,
    required this.icon,
    this.color,
  });
  final String text;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColorsManager.appPrimaryColor),
          color: color ?? Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color:
                  color == AppColorsManager.appPrimaryColor
                      ? Colors.white
                      : AppColorsManager.appPrimaryColor,
            ),
            horizontalSpacing(10),
            Text(
              text,
              style: AppTextStyles.font14GreyWeight400.copyWith(
                color:
                    color == AppColorsManager.appPrimaryColor
                        ? Colors.white
                        : AppColorsManager.appPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ReviewList extends StatelessWidget {
//   const ReviewList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeBloc, HomeState>(
//       builder: (context, state) {
//         var organizerModel = context.read<HomeBloc>().organizerModel?.data;
//         return ListView.builder(
//             itemCount: organizerModel?.reviews?.length ?? 0,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment:
//                   CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//                       radius: 15,
//                       backgroundColor: Colors.transparent,
//                       child: ClipOval(
//                         child: SizedBox.expand(
//                           child: CachedNetworkImage(
//                             fit: BoxFit.cover,
//                             imageUrl: organizerModel
//                                 ?.reviews?[index]
//                                 .reviewerPicture ??
//                                 '',
//                             placeholder: (context, url) =>
//                             const Center(
//                                 child:
//                                 CircularProgressIndicator()),
//                             errorWidget:
//                                 (context, url, error) =>
//                             const Icon(Icons.error),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Gap(20),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment:
//                         CrossAxisAlignment.start,
//                         mainAxisAlignment:
//                         MainAxisAlignment.spaceBetween,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment
//                                 .spaceBetween,
//                             children: [
//                               Text(
//                                   organizerModel
//                                       ?.reviews?[index]
//                                       .reviewerName ??
//                                       '',
//                                   style: getBodyTextStyle(
//                                       fontSize: 18)),
//                               Text(
//                                 getDayAndMonth(organizerModel
//                                     ?.reviews?[index]
//                                     .reviewDate ??
//                                     DateTime.now()),
//                                 style: getSmallTextStyle(
//                                     fontSize: 12,
//                                     color: AppColorsManager.greyColor
//                                         .withOpacity(.5)),
//                               )
//                             ],
//                           ),
//                           const Gap(5),
//                           RatingBar.builder(
//                             initialRating: (organizerModel
//                                 ?.reviews?[index]
//                                 .rate ??
//                                 0)
//                                 .toDouble(),
//                             direction: Axis.horizontal,
//                             minRating: 1,
//                             allowHalfRating: true,
//                             itemCount: 5,
//                             itemSize: 20,
//                             itemPadding:
//                             const EdgeInsets.symmetric(
//                                 horizontal: 4.0),
//                             itemBuilder: (context, _) =>
//                             const Icon(
//                               Icons.star,
//                               color: Colors.amber,
//                             ),
//                             onRatingUpdate: (rating) {},
//                           ),
//                           const Gap(5),
//                           Text(
//                               organizerModel?.reviews?[index]
//                                   .review ??
//                                   '',
//                               style: getSmallTextStyle(
//                                   fontSize: 12)),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             });
//       },
//     );
//   }
// }
