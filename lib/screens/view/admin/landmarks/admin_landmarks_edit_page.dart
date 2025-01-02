import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLandmarksEditPage extends StatefulWidget {
  const AdminLandmarksEditPage({super.key});

  @override
  State<AdminLandmarksEditPage> createState() => _AdminLandmarksEditPageState();
}

class _AdminLandmarksEditPageState extends State<AdminLandmarksEditPage> {
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController landmarkDescriptionController =
      TextEditingController();
  final TextEditingController landmarkAddressController =
      TextEditingController();
  final TextEditingController landmarkReviewsController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landmarks Edit Page'),
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
                  controller: landmarkController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Landmark Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: landmarkDescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Landmark Description',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: landmarkAddressController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Landmark Adress',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: landmarkReviewsController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Landmark Reviews',
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
