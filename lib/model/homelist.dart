import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/registration.png',
      // navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'assets/images/registration.png',
      // navigateScreen: HotelHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/images/registration.png',
      //  navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/images/registration.png',
      //  navigateScreen: DesignCourseHomeScreen(),

    ),
  ];
}
