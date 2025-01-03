import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/logout_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:myapp/widgets/admin/side_bar.dart';
import 'package:myapp/widgets/home/admin_item_list.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final LogoutController logcontroller = Get.put(LogoutController());
  final SupabaseService supabaseService = Get.find<SupabaseService>();

  RxList<Map<String, dynamic>> countries = <Map<String, dynamic>>[].obs;

  RxBool isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    try {
      isLoading.value = true;
      final response = await SupabaseService.client
          .from('country')
          .select('country_name, country_description');

      if (response != null) {
        countries.value = List<Map<String, dynamic>>.from(response as List);
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

  Future<void> deleteCountry(String countryName) async {
    try {
      final response = await SupabaseService.client
          .from('country')
          .delete()
          .eq('country_name', countryName);

      if (response != null) {
        countries
            .removeWhere((country) => country['country_name'] == countryName);
        Get.back();

        Get.snackbar('Success', 'Country deleted successfully',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error', 'Failed to delete country',
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
        onPressed: () => Get.toNamed(RouteName.adminEditPage),
      ),
      appBar: AppBar(
        title: const Text("Admin Page"),
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
              "Countries",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Obx(
              () {
                if (isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return countries.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: countries.length,
                        itemBuilder: (context, index) {
                          final country = countries[index];
                          return AdminItemList(
                            navLink: RouteName.adminEditPage,
                            title: country['country_name'],
                            description: country['country_description'],
                            delete: () =>
                                deleteCountry(country['country_name']),
                            edit: () {
                              Get.toNamed(RouteName.adminEditPage,
                                  arguments: country);
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
