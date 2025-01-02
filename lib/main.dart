import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/routes/routes.dart';
import 'package:myapp/services/storage_service.dart';
import 'package:myapp/services/supabase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  Get.put(SupabaseService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final SupabaseService supabaseService = Get.find<SupabaseService>();

  @override
  Widget build(BuildContext context) {
    // Ensure currentUser  is not null
    final currentUser = supabaseService.currentUser.value;
    final role = currentUser?.userMetadata?['iaAdminpPresent'] as bool? ??
        false; // Default to false

    // Debugging output
    print('User  session: ${StorageService.usersession}');
    print('Role (iaAdminpPresent): ${role ? "True Value" : "False Value"}');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City Guide',
      getPages: Routes.pages,
      initialRoute: _getInitialRoute(role),
      // home: const Home(),
    );
  }

  String _getInitialRoute(bool role) {
    if (StorageService.usersession != null) {
      return role ? RouteName.adminPage : RouteName.home;
    } else {
      return RouteName.login;
    }
  }
}
