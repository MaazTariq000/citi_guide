import 'package:get/get.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/services/storage_service.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/utils/storage_key.dart';

class LogoutController extends GetxController {
  void logout() async {
    StorageService.session.remove(StorageKey.usersession);
    await SupabaseService.client.auth.signOut();
    Get.offAllNamed(RouteName.login);
  }
}
