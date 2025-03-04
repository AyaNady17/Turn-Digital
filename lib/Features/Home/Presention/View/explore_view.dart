import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/event_card.dart';
import 'package:turn_digital/Features/Home/Presention/View/Widgets/explore_custom_app_bar.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';
import 'package:turn_digital/core/global/Helpers/extensions.dart';
import 'package:turn_digital/core/global/Helpers/functions.dart';
import 'package:intl/intl.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getEvents(),
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          backgroundColor: AppColorsManager.scaffoldBackGroundColor,
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            backgroundColor: AppColorsManager.appPrimaryColor,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColorsManager.appPrimaryColor,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ExploreScreenCustomAppBar(),
                verticalSpacing(29),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Events',
                      style: AppTextStyles.font18BlackWeight500,
                    ),
                    Row(
                      children: [
                        Text(
                          'See All',
                          style: AppTextStyles.font14GreyWeight400,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: AppColorsManager.appDarkGreyColor,
                        ),
                      ],
                    ),
                  ],
                ).paddingSymmetricHorizontal(16.w),
                verticalSpacing(16),
                EventListView(),
                verticalSpacing(24),
                SizedBox(
                  width: 338.w,
                  height: 128.h,
                  child: Image.asset(
                    'assets/images/home_banner.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                verticalSpacing(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearby You ',
                      style: AppTextStyles.font18BlackWeight500,
                    ),
                    Row(
                      children: [
                        Text(
                          'See All',
                          style: AppTextStyles.font14GreyWeight400,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: AppColorsManager.appDarkGreyColor,
                        ),
                      ],
                    ),
                  ],
                ).paddingSymmetricHorizontal(16.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
