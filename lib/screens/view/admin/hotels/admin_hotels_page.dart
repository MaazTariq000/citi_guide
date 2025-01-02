import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/logout_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/widgets/admin/side_bar.dart';
import 'package:myapp/widgets/home/admin_item_list.dart';

class AdminHotelsPage extends StatefulWidget {
  const AdminHotelsPage({super.key});

  @override
  State<AdminHotelsPage> createState() => _AdminHotelsPageState();
}

class _AdminHotelsPageState extends State<AdminHotelsPage> {
  final LogoutController logcontroller = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel Page"),
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
              "Hotels",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            AdminItemList(
              navLink: RouteName.adminHotelEditPage,
              title: "1st hotel",
            ),
            AdminItemList(
              navLink: RouteName.adminHotelEditPage,
              title: "2nd hotel",
            ),
            AdminItemList(
              navLink: RouteName.adminHotelEditPage,
              title: "3rd hotel",
            ),
          ],
        ),
      ),
    );
  }
}
