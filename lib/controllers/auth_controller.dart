import 'package:get/get.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/storage_service.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:myapp/utils/storage_key.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  var registerloading = false.obs;
  var loginloading = false.obs;

  Future<void> register(String name, String email, String password) async {
    try {
      registerloading.value = true;
      final AuthResponse data = await SupabaseService.client.auth.signUp(
        email: email,
        password: password,
        data: {"name": name, "iaAdminpPresent": false},
      );
      registerloading.value = false;

      if (data.user != null) {
        StorageService.session
            .write(StorageKey.usersession, data.session!.toJson());
        Get.offAllNamed(RouteName.home);
      }
    } on AuthException catch (e) {
      registerloading.value = false;
      showSnackBar("Error", e.message);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      loginloading.value = true;
      final AuthResponse response = await SupabaseService.client.auth
          .signInWithPassword(email: email, password: password);
      loginloading.value = false;
      if (response.user != null) {
        // print(response.session!.user.userMetadata!["iaAdminpPresent"]);
        StorageService.session
            .write(StorageKey.usersession, response.session!.toJson());
        // final role = await SupabaseService.client.from('public.users').select();
        // print(role);
        if (response.session!.user.userMetadata?["iaAdminpPresent"] == false) {
          Get.offAllNamed(RouteName.home);
        } else {
          Get.offAllNamed(RouteName.adminPage);
        }
        // response.user!.userMetadata!["email"];
      }
    } on AuthApiException catch (e) {
      loginloading.value = false;
      showSnackBar("Error", e.message);
    }
  }
}
