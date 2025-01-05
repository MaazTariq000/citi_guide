import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/logout_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:myapp/widgets/admin/side_bar.dart';
import 'package:myapp/widgets/home/admin_item_list.dart';

class AdminHotelsPage extends StatefulWidget {
  const AdminHotelsPage({super.key});

  @override
  State<AdminHotelsPage> createState() => _AdminHotelsPageState();
}

class _AdminHotelsPageState extends State<AdminHotelsPage> {
  final LogoutController logcontroller = Get.put(LogoutController());
  final SupabaseService supabaseService = Get.find<SupabaseService>();

  RxList<Map<String, dynamic>> hotels = <Map<String, dynamic>>[].obs;

  RxBool isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    fetchHotels();
  }

  Future<void> fetchHotels() async {
    try {
      isLoading.value = true;
      final response = await SupabaseService.client
          .from('hotels')
          .select('hotel_name, hotel_description, hotel_address, hotel_rating');

      if (response.isNotEmpty) {
        hotels.value = List<Map<String, dynamic>>.from(response as List);
        print(response);
      } else {
        Get.snackbar('Error', 'No data received',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteHotel(String hotelName) async {
    try {
      final response = await SupabaseService.client
          .from('hotels')
          .delete()
          .eq('hotel_name', hotelName);

      if (response != null) {
        hotels.removeWhere((hotel) => hotel['hotel_name'] == hotelName);
        Get.back();

        Get.snackbar('Success', 'hotel deleted successfully',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error', 'Failed to delete hotel',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.toNamed(RouteName.adminHotelEditPage),
      ),
      appBar: AppBar(
        title: const Text("Hotels Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              confirmDialog("Are you sure?", "Do you want to logout?", "Logout",
                  () {
                logcontroller.logout();
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: const SideBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hotels",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Obx(
                () {
                  if (isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return hotels.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: hotels.length,
                          itemBuilder: (context, index) {
                            final hotel = hotels[index];
                            return AdminItemList(
                              navLink: RouteName.adminHotelEditPage,
                              title: hotel['hotel_name'],
                              description: hotel['hotel_description'] ??
                                  'No description available',
                              address: hotel['hotel_address'] ??
                                  'no address specified',
                              rating: hotel['hotel_rating'] ?? 'no rating',
                              // delete: (){},
                              delete: () => deleteHotel(hotel['hotel_name']),
                              edit: () {
                                Get.toNamed(RouteName.adminHotelEditPage,
                                    arguments: hotel);
                              },
                            );
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
