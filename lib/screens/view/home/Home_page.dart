import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/view/events/destination_page.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/widgets/circle_image.dart';
import 'package:myapp/widgets/home/list_tile.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = [
    "All",
    "Restaurants",
    "Hotels",
    "Parks",
    "Famous"
  ];

  final Map<String, IconData> filterIcons = {
    "All": Icons.all_inclusive_outlined,
    "Restaurants": Icons.restaurant_outlined,
    "Hotels": Icons.hotel_outlined,
    "Parks": Icons.park_outlined,
    "Famous": Icons.favorite_outline,
  };

  final SupabaseService supabaseService = Get.find<SupabaseService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F9),
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome, ${supabaseService.currentUser.value!.userMetadata?["name"]}👋",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size: 15,
                          color: Color(0xFFF88C49),
                        ),
                        Text(
                          supabaseService.currentUser.value
                                          ?.userMetadata?["country"] !=
                                      null &&
                                  supabaseService.currentUser.value
                                          ?.userMetadata?["city"] !=
                                      null
                              ? "${supabaseService.currentUser.value?.userMetadata?["country"]}, ${supabaseService.currentUser.value?.userMetadata?["city"]}"
                              : "Enter Country, Enter City",
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xFFF88C49)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            CircleImage(
              radius: 20,
              url: supabaseService.currentUser.value?.userMetadata?["image"],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Discover Places",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    final filterIcon = filterIcons[filter];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 255, 243, 224),
                            width: 1.0,
                          ),
                        ),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              filterIcon,
                              size: 15,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              filter,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        // backgroundColor: const Color.fromARGB(
                        //     255, 255, 243, 224),
                        backgroundColor: const Color(0xFFF88C49),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const DestinationPage());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Stack(
                          children: [
                            Container(
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://hips.hearstapps.com/hmg-prod/images/gettyimages-529426770-6504375f0d9d6.jpg?crop=0.671xw:1.00xh;0.151xw,0&resize=640:*",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                height: 70,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Some House",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            size: 10,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            "Karachi , Pakistan",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 10,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            "4.0",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            " 70 Reviews",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Trending Now",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTimeHome(),
              const ListTimeHome(),
              const ListTimeHome(),
            ],
          ),
        ),
      ),
    );
  }
}
