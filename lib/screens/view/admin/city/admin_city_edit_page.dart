import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/supabase_service.dart';
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

  bool isEditMode = false;
  String? originalCityName;

  @override
  void initState() {
    super.initState();

    final Map<String, dynamic>? arguments = Get.arguments;
    if (arguments != null) {
      // Edit mode
      isEditMode = true;
      originalCityName = arguments['citi_name'];
      cityController.text = arguments['citi_name'];
      cityDescriptionController.text = arguments['citi_description'];
    }
  }

  Future<void> addCity() async {
    String cityName = cityController.text.trim();
    String description = cityDescriptionController.text.trim();

    if (cityName.isEmpty || description.isEmpty) {
      Get.snackbar(
        'Error',
        'Both fields are required!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    print("City Name: $cityName, Description: $description");

    try {
      if (isEditMode) {
        final response = await SupabaseService.client
            .from('cities')
            .update({
              'citi_name': cityName,
              'citi_description': description,
            })
            .eq('citi_name', originalCityName ?? '')
            .select();

        if (response.isNotEmpty) {
          Get.snackbar(
            'Success',
            'city updated successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.toNamed(RouteName.adminCityPage);
        }
      } else {
        // Add new city
        final response = await SupabaseService.client.from('cities').insert({
          'citi_name': cityName,
          'citi_description': description,
        }).select();

        if (response.isNotEmpty) {
          Get.snackbar(
            'Success',
            'city added successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.toNamed(RouteName.adminCityPage);
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
            onPressed: () {
              addCity();
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
