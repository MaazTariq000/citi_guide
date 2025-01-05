import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/supabase_service.dart';

class AdminEditPage extends StatefulWidget {
  const AdminEditPage({super.key});

  @override
  State<AdminEditPage> createState() => _AdminEditPageState();
}

class _AdminEditPageState extends State<AdminEditPage> {
  final TextEditingController countryController = TextEditingController();
  final TextEditingController countryDescription = TextEditingController();
  bool isEditMode = false;
  String? originalCountryName;

  @override
  void initState() {
    super.initState();

    final Map<String, dynamic>? arguments = Get.arguments;
    if (arguments != null) {
      // Edit mode
      isEditMode = true;
      originalCountryName = arguments['country_name'];
      countryController.text = arguments['country_name'];
      countryDescription.text = arguments['country_description'];
    }
  }

  Future<void> addCountry() async {
    String countryName = countryController.text.trim();
    String description = countryDescription.text.trim();

    if (countryName.isEmpty || description.isEmpty) {
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
            .from('country')
            .update({
              'country_name': countryName,
              'country_description': description,
            })
            .eq('country_name',
                originalCountryName ?? '')
            .select();

        if (response.isNotEmpty) {
          Get.snackbar(
            'Success',
            'Country updated successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.toNamed(RouteName.adminPage);
        }
      } else {
        // Add new country
        final response = await SupabaseService.client.from('country').insert({
          'country_name': countryName,
          'country_description': description,
        }).select();

        if (response.isNotEmpty) {
          Get.snackbar(
            'Success',
            'Country added successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.toNamed(RouteName.adminPage);
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
            onPressed: addCountry,
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
                      onPressed: () {
                        // Handle file selection for image
                      },
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
