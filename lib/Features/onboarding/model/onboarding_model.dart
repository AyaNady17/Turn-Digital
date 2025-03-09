class OnboardingModel {
  final String? image;
  final String? title;
  final String? subtitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    image: 'assets/images/onboarding1.png',
    title: ' Explore Upcoming and Nearby Events ',
    subtitle:
        ' In publishing and graphic design, Lorem is a placeholder text commonly ',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding2.png',
    title: ' Web Have Modern Events Calendar Feature',
    subtitle:
        ' In publishing and graphic design, Lorem is a placeholder text commonly ',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding3.png',
    title: '  To Look Up More Events or Activities Nearby By Map',
    subtitle:
        ' In publishing and graphic design, Lorem is a placeholder text commonly ',
  ),
];
