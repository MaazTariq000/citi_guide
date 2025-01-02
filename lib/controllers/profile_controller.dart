import 'dart:io';
import 'package:get/get.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/utils/env.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  var loading = false.obs;
  Rx<File?> image = Rx<File?>(null);

  Future<void> updateProfile(String userId, String city, String country) async {
    try {
      loading.value = true;
      var uploadedPath = "";
      if (image.value != null && image.value!.existsSync()) {
        final String dir = "$userId/profile.jpg";
        var path =
            await SupabaseService.client.storage.from(Env.imageBucket).upload(
                  dir,
                  image.value!,
                  fileOptions: const FileOptions(upsert: true),
                );
        uploadedPath = path;
      }

      await SupabaseService.client.auth.updateUser(
        UserAttributes(
          data: {
            "country": country,
            "city": city,
            "image": uploadedPath.isNotEmpty ? uploadedPath : null
          },
        ),
      );
      loading.value = false;
      Get.back();
      showSnackBar("Success", "Profile has been updated");
    } on StorageException catch (e) {
      loading.value = false;
      showSnackBar("Error", e.message);
    } on AuthApiException catch (e) {
      loading.value = false;
      showSnackBar("Error", e.message);
    } catch (e) {
      loading.value = false;
      showSnackBar("Error", "Something went wrong");
    }
  }

  void pickImage() async {
    File? file = await pickImageFormGallery();
    if (file != null) {
      image.value = file;
    }
  }
}
