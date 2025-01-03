// // import 'package:get/get.dart';

// import 'package:get/get.dart';
// import 'package:myapp/services/supabase_service.dart';

// class CountryController extends GetxController {
//   RxList<Map<String, dynamic>> countries = <Map<String, dynamic>>[].obs;

//   Future<void> fetchCountries() async {
//     try {
//       final response = await SupabaseService.client
//           .from('country')
//           .select('country_name, country_description');

//       if (response != null) {
//         countries.value = List<Map<String, dynamic>>.from(response as List);
//       } else {
//         Get.snackbar('Error', 'No data received',
//             snackPosition: SnackPosition.BOTTOM);
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
//     }
//   }

//   Future<void> deleteCountry(String countryName) async {
//     try {
//       final response = await SupabaseService.client
//           .from('country')
//           .delete()
//           .eq('country_name', countryName);
//       if (response != null) {
//         countries
//             .removeWhere((country) => country['country_name'] == countryName);
//         Get.snackbar('Success', 'Country deleted successfully',
//             snackPosition: SnackPosition.BOTTOM);
//       } else {
//         Get.snackbar('Error', 'Failed to delete country',
//             snackPosition: SnackPosition.BOTTOM);
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
//     }
//   }


// }
