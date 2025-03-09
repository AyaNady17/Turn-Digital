import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

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
