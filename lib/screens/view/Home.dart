import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/services/navigation_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NavigationServices navigationService = Get.put(NavigationServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          navigationService.updateIndex(value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            selectedIcon: Icon(
              Icons.home,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(
              Icons.search,
            ),
            label: "Search",
          ),
          NavigationDestination(
            icon: Icon(Icons.event),
            selectedIcon: Icon(
              Icons.favorite,
            ),
            label: "Events",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(
            microseconds: 500,
          ),
          switchInCurve: Curves.ease,
          switchOutCurve: Curves.ease,
          child: navigationService.pages[navigationService.currentIndex.value],
        ),
      ),
    );
  }
}
