import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/logout_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/widgets/admin/side_bar.dart';
import 'package:myapp/widgets/home/admin_item_list.dart';

class AdminEventsPage extends StatefulWidget {
  const AdminEventsPage({super.key});

  @override
  State<AdminEventsPage> createState() => _AdminEventsPageState();
}

class _AdminEventsPageState extends State<AdminEventsPage> {
  final LogoutController logcontroller = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Page"),
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
              "Events",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            AdminItemList(
              title: "New year 2025",
              navLink: RouteName.adminEventEditPage,
              description: "kuch",
              delete: () {},
              edit: (){},
            ),
            AdminItemList(
              navLink: RouteName.adminEventEditPage,
              title: "Independence Day",
              description: "kuch",
              delete: () {},
              edit: (){},
            ),
            AdminItemList(
              navLink: RouteName.adminEventEditPage,
              title: "Bablo ki Shadi",
              description: "kuch",
              delete: () {},
              edit: (){},
            ),
          ],
        ),
      ),
    );
  }
}
