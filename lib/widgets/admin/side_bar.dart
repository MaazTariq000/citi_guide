import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/route_name.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(
            title: Text(
              "Admin",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => Get.toNamed(RouteName.adminPage),
            child: const ListTile(
              title: Text("Country"),
              trailing: Icon(Icons.public),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(RouteName.adminCityPage),
            child: const ListTile(
              title: Text("City"),
              trailing: Icon(Icons.location_city),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(RouteName.adminHotelPage),
            child: const ListTile(
              title: Text("Hotels"),
              trailing: Icon(Icons.hotel),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(RouteName.adminLandmarkPage),
            child: const ListTile(
              title: Text("Landmarks"),
              trailing: Icon(Icons.landscape),
            ),
          ),
          // GestureDetector(
          //   onTap: () => Get.toNamed(RouteName.adminEventPage),
          //   child: const ListTile(
          //     title: Text("Events"),
          //     trailing: Icon(Icons.event),
          //   ),
          // ),
        ],
      ),
    );
  }
}
