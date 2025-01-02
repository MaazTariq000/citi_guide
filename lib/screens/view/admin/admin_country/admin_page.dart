import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/logout_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:myapp/widgets/admin/side_bar.dart';
import 'package:myapp/widgets/home/admin_item_list.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final LogoutController logcontroller = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.notes)),
        title: const Text("Admin Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              confirmDialog("Are you sure?", "Do you want to logout?", "Logout",
                  () {
                logcontroller.logout();
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
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
              "Countries",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            AdminItemList(
              navLink: RouteName.adminEditPage,
              title: "Italy",
            ),
            AdminItemList(
              navLink: RouteName.adminEditPage,
              title: "Japan",
            ),
            AdminItemList(
              navLink: RouteName.adminEditPage,
              title: "India",
            ),
          ],
        ),
      ),
    );
  }
}
