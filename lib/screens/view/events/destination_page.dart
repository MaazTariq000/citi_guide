import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/modal/destination.dart'; // Ensure you import your Destination model
import 'package:myapp/widgets/home/list_tile.dart';

class DestinationPage extends StatelessWidget {
  const DestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the destination passed from HomePage
    final Destination destination = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(destination.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 20,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.favorite,
                            size: 24,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 22,
                        color: const Color(0xFFF88C49),
                      ),
                      Text(
                        destination.location,
                        style: const TextStyle(
                            fontSize: 15, color: Color(0xFFF88C49)),
                      ),
                    ],
                  ),
                ),
                Text(
                  destination.title,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  destination.description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.transparent),
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                          elevation: WidgetStateProperty.all(0),
                        ),
                        icon: const Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        label: Text(
                          destination.rating.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.transparent),
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                          elevation: WidgetStateProperty.all(0),
                        ),
                        icon: const Icon(
                          Icons.message_outlined,
                          size: 18,
                          color: Color(0xFFF88C49),
                        ),
                        label: const Text(
                          "Read Reviews",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF88C49),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Services in ${destination.title}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTimeHome(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: 5),
          ),
          minimumSize: WidgetStateProperty.all(const Size(150, 50)),
          backgroundColor: WidgetStateProperty.all(const Color(0xFFF88C49)),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        child: const Text(
          "Get Directions",
        ),
      ),
    );
  }
}
