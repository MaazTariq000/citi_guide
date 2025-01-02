import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:myapp/utils/helpers.dart';

class AdminHotelsEditPage extends StatefulWidget {
  const AdminHotelsEditPage({super.key});

  @override
  State<AdminHotelsEditPage> createState() => _AdminHotelsEditPageState();
}

class _AdminHotelsEditPageState extends State<AdminHotelsEditPage> {
  final TextEditingController hotelController = TextEditingController();
  final TextEditingController hotelDescriptionController =
      TextEditingController();
  final TextEditingController hotelAddressController = TextEditingController();
  final TextEditingController hotelReviewsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels Edit Page'),
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
                  controller: hotelController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Hotel Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: hotelDescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Hotel Description',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: hotelAddressController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Hotel Address',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: hotelReviewsController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Hotel Reviews',
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
