import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/logout_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/widgets/admin/side_bar.dart';
import 'package:myapp/widgets/home/admin_item_list.dart';

class AdminCityPage extends StatefulWidget {
  const AdminCityPage({super.key});

  @override
  State<AdminCityPage> createState() => _AdminCityPageState();
}

class _AdminCityPageState extends State<AdminCityPage> {
  final LogoutController logcontroller = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.notes)),
        title: const Text("City Page"),
        centerTitle: true,
      ),
      drawer: const SideBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cities",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            AdminItemList(
              navLink: RouteName.adminCityEditPage,
              title: "Milan",
            ),
            AdminItemList(
              navLink: RouteName.adminCityEditPage,
              title: "Tokyo",
            ),
            AdminItemList(
              navLink: RouteName.adminCityEditPage,
              title: "Mumbai",
            ),
          ],
        ),
      ),
    );
  }
}
