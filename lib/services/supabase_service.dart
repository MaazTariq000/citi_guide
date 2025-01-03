import 'package:get/get.dart';
// import 'package:http/http.dart';
import 'package:myapp/utils/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:myapp/services/supabase_service.dart';

class SupabaseService extends GetxService {
  Rx<User?> currentUser = Rx<User?>(null);

  @override
  void onInit() async {
    await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseKey);
    currentUser.value = client.auth.currentUser;
    listenAuthChanges();
    super.onInit();
  }

  static final SupabaseClient client = Supabase.instance.client;

  void listenAuthChanges() {
    client.auth.onAuthStateChange.listen(
      (data) {
        final AuthChangeEvent event = data.event;
        if (event == AuthChangeEvent.userUpdated) {
          currentUser.value = data.session?.user;
        } else if (event == AuthChangeEvent.signedIn) {
          currentUser.value = data.session?.user;
        }
      },
    );
  }

  // // Fetch cities from the database
  // static Future<List<City>> fetchCities() async {
  //   final response = await client.from('city').select().execute();
  //   if (response.error == null) {
  //     return (response.data as List)
  //         .map((city) => City.fromJson(city))
  //         .toList();
  //   } else {
  //     throw response.error!;
  //   }
  // }

  // // Delete a city from the database
  // static Future<void> deleteCity(String cityName) async {
  //   final response =
  //       await client.from('city').delete().eq('city_name', cityName).execute();
  //   if (response.error != null) {
  //     throw response.error!;
  //   }
  // }

  // Update city details
//   static Future<void> updateCity(City city) async {
//     final response = await client
//         .from('city')
//         .update(city.toJson())
//         .eq('city_name', city.cityName);
//     if (response.error != null) {
//       throw response.error!;
//     }
//   }
}
