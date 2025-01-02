import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:myapp/utils/helpers.dart';

class AdminCityEditPage extends StatefulWidget {
  const AdminCityEditPage({super.key});

  @override
  State<AdminCityEditPage> createState() => _AdminCityEditPageState();
}

class _AdminCityEditPageState extends State<AdminCityEditPage> {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController cityDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Edit Page'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
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
                  controller: cityController,
                  decoration: const InputDecoration(
                    labelText: 'Enter City Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: cityDescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Enter City Description',
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
