import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/Home/Presention/View/explore_view.dart';
import 'package:turn_digital/Features/Home/Presention/View/see_all_events_view.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';

class NotchedBottomAppBar extends StatefulWidget {
  const NotchedBottomAppBar({super.key});

  @override
  NotchedBottomAppBarState createState() => NotchedBottomAppBarState();
}

class NotchedBottomAppBarState extends State<NotchedBottomAppBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    ExploreView(),
    BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: SeeAllEventsView(isSavedEventsPage: true),
    ),
    Center(child: Text("Map Page")),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem('assets/images/explore_active.png', "Explore", 0),
              _buildNavItem('assets/images/calendar_icon.png', "Events", 1),
              horizontalSpacing(50),
              _buildNavItem('assets/images/map_icon.png', "Map", 2),
              _buildNavItem('assets/images/Profile.png', "Profile", 3),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        shape: const CircleBorder(),
        elevation: 8.0,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(String imagePath, String label, int index) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: 24.h,
            color: isActive ? AppColorsManager.appPrimaryColor : Colors.grey,
          ),
          Text(
            label,
            style:
                isActive
                    ? AppTextStyles.font14GreyWeight400.copyWith(
                      color: AppColorsManager.appPrimaryColor,
                    )
                    : AppTextStyles.font14GreyWeight400,
          ),
        ],
      ),
    );
  }
}
