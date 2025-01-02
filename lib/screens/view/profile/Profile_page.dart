import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/logout_controller.dart';
import 'package:myapp/controllers/profile_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:myapp/widgets/circle_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController controller = Get.put(ProfileController());
  final SupabaseService supabaseService = Get.find<SupabaseService>();
  final LogoutController logcontroller = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  color: const Color(0xFFF88C49),
                ),
                Positioned(
                    bottom: -45,
                    left: 0,
                    right: 0,
                    child: CircleImage(
                      radius: 60,
                      url: supabaseService
                          .currentUser.value?.userMetadata?["image"],
                    )),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              supabaseService.currentUser.value!.userMetadata?["name"],
              style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            Text(
              supabaseService.currentUser.value?.userMetadata?["country"] !=
                          null &&
                      supabaseService
                              .currentUser.value?.userMetadata?["city"] !=
                          null
                  ? "${supabaseService.currentUser.value?.userMetadata!["country"]}, ${supabaseService.currentUser.value?.userMetadata!["city"]}"
                  : "Enter Country, Enter City",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),

            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(RouteName.editProfilePage),
              child: const ListTile(
                leading: Icon(Icons.edit),
                title: Text("Edit Profile"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            GestureDetector(
              onTap: () => confirmDialog("Are you sure?",
                  "Do you want to logout?", "logout", logcontroller.logout),
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text("Sign out"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ),
      ),
    );
  }
}
