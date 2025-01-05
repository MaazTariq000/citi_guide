import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/supabase_service.dart';

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

  bool isEditMode = false;
  String? originalLandmarksName;

  @override
  void initState() {
    super.initState();

    final Map<String, dynamic>? arguments = Get.arguments;
    if (arguments != null) {
      // Edit mode
      isEditMode = true;
      originalLandmarksName = arguments['landMark_name'];
      landmarkController.text = arguments['landMark_name'];
      landmarkDescriptionController.text = arguments['landMark_description'];
      landmarkAddressController.text = arguments['landMark_address'];
    }
  }

  Future<void> addLandmarks() async {
    String landmarkName = landmarkController.text.trim();
    String description = landmarkDescriptionController.text.trim();
    String address = landmarkAddressController.text.trim();

    if (landmarkName.isEmpty || description.isEmpty || address.isEmpty) {
      Get.snackbar(
        'Error',
        'Both fields are required!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      if (isEditMode) {
        // Update existing country
        final response = await SupabaseService.client
            .from('landmarks')
            .update({
              'landMark_name': landmarkName,
              'landMark_description': description,
              'landMark_address': address,
            })
            .eq('landMark_name', originalLandmarksName ?? '')
            .select();

        if (response.isNotEmpty) {
          Get.snackbar(
            'Success',
            'landmark updated successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.toNamed(RouteName.adminPage);
        }
      } else {
        // Add new country
        final response = await SupabaseService.client.from('landmarks').insert({
          'landMark_name': landmarkName,
          'landMark_description': description,
          'landMark_address': address,
        }).select();

        if (response.isNotEmpty) {
          Get.snackbar(
            'Success',
            'landmark added successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.toNamed(RouteName.adminLandmarkPage);
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

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
            onPressed: () {
              addLandmarks();
            },
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
