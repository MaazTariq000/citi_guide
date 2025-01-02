import 'package:flutter/material.dart';
import 'package:myapp/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/widgets/circle_image.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController countryEditingController =
      TextEditingController(text: "");
  final TextEditingController cityEditingController =
      TextEditingController(text: "");
  final ProfileController controller = Get.find<ProfileController>();
  final SupabaseService supabaseService = Get.find<SupabaseService>();

  @override
  void initState() {
    final userMetadata =
        supabaseService.currentUser.value?.userMetadata;
    if (userMetadata != null &&
        userMetadata["country"] != null &&
        userMetadata["city"] != null) {
      countryEditingController.text = userMetadata["country"];
      cityEditingController.text = userMetadata["city"];
    }
    super.initState();
  }

  @override
  void dispose() {
    countryEditingController.dispose();
    cityEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        actions: [
          Obx(
            () => TextButton(
              onPressed: () {
                controller.updateProfile(supabaseService.currentUser.value!.id,
                    countryEditingController.text, cityEditingController.text);
              },
              child: controller.loading.value
                  ? const SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    )
                  : const Text(
                      "Done",
                    ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => Center(
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      // const CircleAvatar(
                      //   backgroundImage: NetworkImage(
                      //       "https://media.proprofs.com/images/QM/user_images/2503852/New%20Project%20(23)(81).jpg"),
                      //   radius: 80,
                      // ),
                      CircleImage(
                        radius: 80,
                        file: controller.image.value,
                        url: supabaseService
                            .currentUser.value?.userMetadata?["image"],
                      ),
                      IconButton(
                        onPressed: () {
                          controller.pickImage();
                        },
                        icon: const CircleAvatar(
                          // radius: ,
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: countryEditingController,
                decoration: const InputDecoration(
                  hintText: "Enter your Country...",
                  label: Text(
                    "Country",
                  ),
                ),
              ),
              TextFormField(
                controller: cityEditingController,
                decoration: const InputDecoration(
                  hintText: "Enter your city...",
                  label: Text(
                    "City",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
