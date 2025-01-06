import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:myapp/screens/view/events/destination_page.dart';
import 'package:myapp/screens/view/events/event_page.dart';
import 'package:myapp/screens/view/home/Home_page.dart';
import 'package:myapp/screens/view/profile/Profile_page.dart';
import 'package:myapp/screens/view/serach/Search_page.dart';

class NavigationServices extends GetxService {
  var currentIndex = 0.obs;
  var previousIndex = 0.obs;

  List<Widget> pages = [
    const HomePage(),
    SearchPage(),
    const EventPage(),
    const ProfilePage()
  ];

  void updateIndex(value) {
    previousIndex.value = currentIndex.value;
    currentIndex.value = value;
  }

  void backToPrev() {
    currentIndex.value = previousIndex.value;
  }
}
