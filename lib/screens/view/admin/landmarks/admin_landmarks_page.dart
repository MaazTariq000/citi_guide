import 'package:flutter/material.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/widgets/admin/side_bar.dart';
import 'package:myapp/widgets/home/admin_item_list.dart';

class AdminLandmarksPage extends StatefulWidget {
  const AdminLandmarksPage({super.key});

  @override
  State<AdminLandmarksPage> createState() => _AdminLandmarksPageState();
}

class _AdminLandmarksPageState extends State<AdminLandmarksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Landmark Page"),
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
              "Landmarks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            AdminItemList(
              navLink: RouteName.adminLandmarkEditPage,
              title: "Fountains",
              description: "kuch",
              delete: () {},
              edit: () {},
            ),
            AdminItemList(
              title: "Waterfall",
              navLink: RouteName.adminLandmarkEditPage,
              description: "kuch",
              delete: () {},
              edit: (){},
            ),
            AdminItemList(
              title: "Beach",
              navLink: RouteName.adminLandmarkEditPage,
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
