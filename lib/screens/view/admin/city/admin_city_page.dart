import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/logout_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:myapp/widgets/admin/side_bar.dart';
import 'package:myapp/widgets/home/admin_item_list.dart';

class AdminCityPage extends StatefulWidget {
  const AdminCityPage({super.key});

  @override
  State<AdminCityPage> createState() => _AdminCityPageState();
}

class _AdminCityPageState extends State<AdminCityPage> {
  final SupabaseService supabaseService = Get.find<SupabaseService>();
  final LogoutController logcontroller = Get.put(LogoutController());

  RxList<Map<String, dynamic>> cities = <Map<String, dynamic>>[].obs;

  RxBool isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    fetchCities();
  }

  Future<void> fetchCities() async {
    try {
      isLoading.value = true;
      final response = await SupabaseService.client
          .from('cities')
          .select('citi_name, citi_description');

      if (response.isNotEmpty) {
        cities.value = List<Map<String, dynamic>>.from(response as List);
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

  Future<void> deleteCities(String cityName) async {
    try {
      final response = await SupabaseService.client
          .from('cities')
          .delete()
          .eq('citi_name', cityName);

      if (response != null) {
        cities.removeWhere((city) => city['citi_name'] == cityName);
        Get.back();

        Get.snackbar('Success', 'city deleted successfully',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error', 'Failed to delete city',
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
        onPressed: () => Get.toNamed(RouteName.adminCityEditPage),
      ),
      appBar: AppBar(
        title: const Text("Admin City Page"),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "City",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Obx(
              () {
                if (isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return cities.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          final city = cities[index];
                          return AdminItemList(
                            navLink: RouteName.adminCityEditPage,
                            title: city['citi_name'],
                            description: city['citi_description'],
                            address: "",
                            rating: "",
                            delete: () => deleteCities(city['citi_name']),
                            edit: () {
                              Get.toNamed(RouteName.adminCityEditPage,
                                  arguments: city);
                            },
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
