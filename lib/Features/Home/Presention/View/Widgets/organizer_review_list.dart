import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_state.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

class OrganizerReviewList extends StatelessWidget {
  const OrganizerReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var organizerModel = state.organizerModel;
        return ListView.builder(
          itemCount: organizerModel!.reviews.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: SizedBox.expand(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              organizerModel.reviews[index].reviewerPicture,
                          placeholder:
                              (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          errorWidget:
                              (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  horizontalSpacing(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              organizerModel.reviews[index].reviewerName ?? '',
                              style: AppTextStyles.font18BlackWeight500
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            Text(
                              formatFullDate(
                                organizerModel.reviews[index].reviewDate,
                              ),
                              style: AppTextStyles.font14GreyWeight400,
                            ),
                          ],
                        ),
                        verticalSpacing(5),
                        RatingBar.builder(
                          initialRating:
                              (organizerModel.reviews[index].rate ?? 0)
                                  .toDouble(),
                          direction: Axis.horizontal,
                          minRating: 1,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,

                          itemBuilder:
                              (context, _) =>
                                  const Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {},
                        ),
                        verticalSpacing(5),
                        Text(
                          organizerModel.reviews[index].review,
                          style: AppTextStyles.font15BlackWeight400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
