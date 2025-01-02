import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/route_name.dart';
// import 'package:myapp/utils/helpers.dart';

class AdminEditPage extends StatefulWidget {
  const AdminEditPage({super.key});

  @override
  State<AdminEditPage> createState() => _AdminEditPageState();
}

class _AdminEditPageState extends State<AdminEditPage> {
  final TextEditingController countryController = TextEditingController();
  final TextEditingController countryDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Page'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(RouteName.adminPage);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Done"),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                TextField(
                  controller: countryController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Country Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: countryDescription,
                  decoration: const InputDecoration(
                    labelText: 'Enter Country Description',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Pick an appropriate image.",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.attach_file,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
