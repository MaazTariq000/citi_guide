import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/modal/destination.dart';
import 'package:myapp/routes/route_name.dart';
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

  final List<Destination> destinations = [
    Destination(
      title: "Mazar-e-Quaid",
      location: "Karachi, Pakistan",
      description:
          "The mausoleum of Muhammad Ali Jinnah, the founder of Pakistan.",
      rating: 4.0,
      reviews: 70,
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Jinnah_Mausoleum.JPG/1200px-Jinnah_Mausoleum.JPG",
    ),
    Destination(
      title: "Eiffel Tower",
      location: "Paris, France",
      description:
          "An iconic wrought-iron lattice tower located on the Champ de Mars in Paris.",
      rating: 4.5,
      reviews: 150,
      imageUrl:
          "https://ihplb.b-cdn.net/wp-content/uploads/2021/11/eifel-tower.jpg",
    ),
    Destination(
      title: "Statue of Liberty",
      location: "New York City, USA",
      description:
          "A colossal neoclassical sculpture on Liberty Island in New York Harbor.",
      rating: 4.7,
      reviews: 200,
      imageUrl:
          "https://www.planetware.com/wpimages/2020/08/top-attractions-in-the-world-new-york-statue-of-liberty.jpg",
    ),
    Destination(
      title: "Mount Fuji",
      location: "Honshu, Japan",
      description:
          "An active stratovolcano and the highest mountain in Japan, known for its symmetrical cone.",
      rating: 4.8,
      reviews: 120,
      imageUrl:
          "https://www.planetware.com/wpimages/2019/10/asia-best-places-to-visit-mount-fuji-japan.jpg",
    ),
    Destination(
      title: "The Great Sphinx",
      location: "Giza, Egypt",
      description:
          "A limestone statue of a reclining sphinx, a mythical creature with a lion's body and a human head.",
      rating: 4.6,
      reviews: 90,
      imageUrl:
          "https://www.pandotrip.com/wp-content/uploads/2018/03/The-Great-Sphinx-Egypt.jpg",
    ),
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
                      child: GestureDetector(
                        onTap: () => Get.toNamed(
                          RouteName.searchPage,
                          arguments: filter,
                        ),
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
                  itemCount: destinations.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final destination = destinations[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the destination page and pass the destination object
                        Get.toNamed(
                          RouteName.destinationPage,
                          arguments: destination, // Pass the destination object
                        );
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
                                image: DecorationImage(
                                  image: NetworkImage(destination.imageUrl),
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        destination.title,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.location_pin,
                                            size: 10,
                                          ),
                                          const SizedBox(width: 2),
                                          Text(
                                            destination.location,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 10,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            destination.rating.toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            " ${destination.reviews} Reviews",
                                            style:
                                                const TextStyle(fontSize: 10),
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
              GestureDetector(
                onTap: () => Get.toNamed(RouteName.destinationPage),
                child: ListTimeHome(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
