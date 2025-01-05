import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/supabase_service.dart';
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

  bool isEditMode = false;
  String? originalHotelName;

  @override
  void initState() {
    super.initState();

    final Map<String, dynamic>? arguments = Get.arguments;
    if (arguments != null) {
      isEditMode = true;
      originalHotelName = arguments['hotel_name'];
      hotelController.text = arguments['hotel_name'];
      hotelDescriptionController.text = arguments['hotel_description'];
      hotelAddressController.text = arguments['hotel_address'];
      hotelReviewsController.text = arguments['hotel_rating'];
    }
  }

  Future<void> addHotel() async {
    String hotelName = hotelController.text.trim();
    String description = hotelDescriptionController.text.trim();
    String address = hotelAddressController.text.trim();
    String rating = hotelReviewsController.text.trim();

    if (hotelName.isEmpty ||
        description.isEmpty ||
        address.isEmpty ||
        rating.isEmpty) {
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
        final response = await SupabaseService.client
            .from('hotels')
            .update({
              'hotel_name': hotelName,
              'hotel_description': description,
              'hotel_address': address,
              'hotel_rating': rating,
            })
            .eq('hotel_name', originalHotelName ?? '')
            .select();

        if (response.isNotEmpty) {
          Get.snackbar(
            'Success',
            'Hotel updated successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.toNamed(RouteName.adminHotelPage);
        }
      } else {
        final response = await SupabaseService.client.from('hotels').insert({
          'hotel_name': hotelName,
          'hotel_description': description,
          'hotel_address': address,
          'hotel_rating': rating,
        }).select();

        if (response.isNotEmpty) {
          Get.snackbar(
            'Success',
            'hotel added successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.toNamed(RouteName.adminHotelPage);
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
            onPressed: () {
              addHotel();
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
