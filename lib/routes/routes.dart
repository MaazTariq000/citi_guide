import 'package:get/get.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/screens/auth/Login_page.dart';
import 'package:myapp/screens/auth/signup_page.dart';
import 'package:myapp/screens/view/Home.dart';
import 'package:myapp/screens/view/admin/admin_country/admin_edit_page.dart';
import 'package:myapp/screens/view/admin/admin_country/admin_page.dart';
import 'package:myapp/screens/view/admin/city/admin_city_edit_page.dart';
import 'package:myapp/screens/view/admin/city/admin_city_page.dart';
import 'package:myapp/screens/view/admin/events/admin_events_edit_page.dart';
import 'package:myapp/screens/view/admin/events/admin_events_page.dart';
import 'package:myapp/screens/view/admin/hotels/admin_hotels_edit_page.dart';
import 'package:myapp/screens/view/admin/hotels/admin_hotels_page.dart';
import 'package:myapp/screens/view/admin/landmarks/admin_landmarks_edit_page.dart';
import 'package:myapp/screens/view/admin/landmarks/admin_landmarks_page.dart';
import 'package:myapp/screens/view/events/destination_page.dart';
import 'package:myapp/screens/view/profile/edit_profile_page.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => Home(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteName.signup,
      page: () => const SignupPage(),
    ),
    GetPage(
      name: RouteName.destinationPage,
      page: () => const DestinationPage(),
    ),
    GetPage(
        name: RouteName.editProfilePage,
        page: () => const EditProfilePage(),
        transition: Transition.rightToLeft),
    GetPage(
      name: RouteName.adminPage,
      page: () => const AdminPage(),
      // transition: Transition.rightToLeft
    ),
    GetPage(
      name: RouteName.adminEditPage,
      page: () => AdminEditPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.adminCityPage,
      page: () => const AdminCityPage(),
      // transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.adminCityEditPage,
      page: () => const AdminCityEditPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.adminEventPage,
      page: () => const AdminEventsPage(),
      // transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.adminEventEditPage,
      page: () => const AdminEventsEditPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.adminHotelPage,
      page: () => const AdminHotelsPage(),
      // transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.adminHotelEditPage,
      page: () => const AdminHotelsEditPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.adminLandmarkPage,
      page: () => const AdminLandmarksPage(),
      // transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.adminLandmarkEditPage,
      page: () => const AdminLandmarksEditPage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
