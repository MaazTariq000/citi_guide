// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:myapp/services/supabase_service.dart';

// class CountryController extends GetxController {
//   Rx<bool> isLoading = false.obs;
//   Rx<List> countries = Rx<List>([]);

//   Future<void> getAllCountries() async {
//     try {
//       final responce = await SupabaseService.client.from("countries").select();

//       print(jsonEncode(responce));
//     } catch (e) {}
//   }
// }
