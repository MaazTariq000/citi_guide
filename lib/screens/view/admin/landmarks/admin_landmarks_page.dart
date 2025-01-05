import 'package:flutter/material.dart';
import 'package:myapp/controllers/logout_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:myapp/widgets/admin/side_bar.dart';
import 'package:myapp/widgets/home/admin_item_list.dart';
import 'package:get/get.dart';

class AdminLandmarksPage extends StatefulWidget {
  const AdminLandmarksPage({super.key});

  @override
  State<AdminLandmarksPage> createState() => _AdminLandmarksPageState();
}

class _AdminLandmarksPageState extends State<AdminLandmarksPage> {
  final LogoutController logcontroller = Get.put(LogoutController());
  final SupabaseService supabaseService = Get.find<SupabaseService>();

  RxList<Map<String, dynamic>> landmarks = <Map<String, dynamic>>[].obs;

  RxBool isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    fetchLandmarks();
  }

  Future<void> fetchLandmarks() async {
    try {
      isLoading.value = true;
      final response = await SupabaseService.client
          .from('landmarks')
          .select('landMark_name, landMark_description, landMark_address');

      if (response.isNotEmpty) {
        landmarks.value = List<Map<String, dynamic>>.from(response as List);
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

  Future<void> deleteLandmarks(String landmarksName) async {
    try {
      final response = await SupabaseService.client
          .from('landmarks')
          .delete()
          .eq('landMark_name', landmarksName);

      if (response != null) {
        landmarks.removeWhere(
            (landmarks) => landmarks['landMark_name'] == landmarksName);
        Get.back();

        Get.snackbar('Success', 'landmarks deleted successfully',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error', 'Failed to delete landmarks',
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
        onPressed: () => Get.toNamed(RouteName.adminLandmarkEditPage),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Landmarks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Obx(
                () {
                  if (isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return landmarks.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: landmarks.length,
                          itemBuilder: (context, index) {
                            final landmark = landmarks[index];
                            return AdminItemList(
                              navLink: RouteName.adminLandmarkEditPage,
                              title: landmark['landMark_name'],
                              description: landmark['landMark_description'],
                              address: landmark['landMark_address'],
                              rating: "",
                              delete: () =>
                                  deleteLandmarks(landmark['landMark_name']),
                              edit: () {
                                Get.toNamed(RouteName.adminLandmarkEditPage,
                                    arguments: landmark);
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
