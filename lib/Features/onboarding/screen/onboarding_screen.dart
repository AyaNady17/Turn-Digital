import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:turn_digital/Core/Database/shared_prefrences_services.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Core/Routing/routes.dart';
import 'package:turn_digital/core/global/Helpers/functions.dart';
import 'package:turn_digital/core/global/theming/app_text_styles.dart';

import '../model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboardingPages.length,
              controller: pageController,
              onPageChanged: (value) {
                currentPage = value;
                setState(() {});
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Image.asset(
                        '${onboardingPages[index].image}',
                        fit: BoxFit.fill,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(40),
                          decoration: const BoxDecoration(
                            color: AppColorsManager.appPrimaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(48),
                              topRight: Radius.circular(48),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${onboardingPages[index].title}',
                                style: AppTextStyles.font16WhiteWeight400,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacing(20),
                              Text(
                                '${onboardingPages[index].subtitle}',
                                style: AppTextStyles.font12WhiteWeight400,
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      SharedPreferencesService.setBool(
                                        SharedPreferencesService
                                            .isOnboardingVistiedKey,
                                        true,
                                      );
                                      Navigator.pushReplacementNamed(
                                        context,
                                        AppRoutes.rSignUp,
                                      );
                                    },
                                    child: Text(
                                      'Skip',
                                      style: AppTextStyles.font12WhiteWeight400,
                                    ),
                                  ),
                                  SmoothPageIndicator(
                                    controller: pageController,
                                    count: 3,
                                    effect: ColorTransitionEffect(
                                      activeDotColor: Colors.white,
                                      dotColor: Colors.white.withOpacity(0.5),
                                      dotHeight: 8,
                                      dotWidth: 8,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (currentPage <
                                          onboardingPages.length - 1) {
                                        pageController.nextPage(
                                          duration: const Duration(
                                            milliseconds: 600,
                                          ),
                                          curve: Curves.easeInOut,
                                        );
                                      } else {
                                        SharedPreferencesService.setBool(
                                          SharedPreferencesService
                                              .isOnboardingVistiedKey,
                                          true,
                                        );
                                        Navigator.pushReplacementNamed(
                                          context,
                                          AppRoutes.rSignUp,
                                        );
                                      }
                                    },
                                    child: Text(
                                      'Next',
                                      style: AppTextStyles.font12WhiteWeight400,
                                    ),
                                  ),
                                ],
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
        ],
      ),
    );
  }
}
