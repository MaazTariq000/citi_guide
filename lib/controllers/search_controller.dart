import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SearchesController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<dynamic> searchResults = <dynamic>[].obs;

  Future<void> fetchSearchResults(String query) async {
    if (query.isEmpty) return;

    isLoading.value = true;
    searchResults.clear();

    try {
      final countries = await Supabase.instance.client
          .from('country')
          .select('country_name, country_description')
          .ilike('country_name', '%$query%');

      final landmarks = await Supabase.instance.client
          .from('landmarks')
          .select('landMark_name, landMark_description')
          .ilike('landMark_name', '%$query%');

      final cities = await Supabase.instance.client
          .from('cities')
          .select('citi_name, citi_description')
          .ilike('citi_name', '%$query%');

      final hotels = await Supabase.instance.client
          .from('hotels')
          .select('hotel_name, hotel_description')
          .ilike('hotel_name', '%$query%');

      searchResults.addAll([
        ...countries.map((e) => {
              'name': e['country_name'],
              'description': e['country_description']
            }),
        ...landmarks.map((e) => {
              'name': e['landMark_name'],
              'description': e['landMark_description']
            }),
        ...cities.map((e) =>
            {'name': e['citi_name'], 'description': e['citi_description']}),
        ...hotels.map((e) =>
            {'name': e['hotel_name'], 'description': e['hotel_description']}),
      ]);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
