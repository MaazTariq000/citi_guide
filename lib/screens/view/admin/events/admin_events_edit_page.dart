import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:myapp/utils/helpers.dart';

class AdminEventsEditPage extends StatefulWidget {
  const AdminEventsEditPage({super.key});

  @override
  State<AdminEventsEditPage> createState() => _AdminEventsEditPageState();
}

class _AdminEventsEditPageState extends State<AdminEventsEditPage> {
  final TextEditingController eventController = TextEditingController();
  final TextEditingController eventDescriptionController =
      TextEditingController();
  final TextEditingController eventAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Edit Page'),
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
                  controller: eventController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Event Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: eventDescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Event Description',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: eventAddressController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Event Address',
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
