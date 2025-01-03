import 'package:flutter/material.dart';
import 'package:myapp/widgets/home/list_tile.dart';

class DestinationPage extends StatelessWidget {
  const DestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://plus.unsplash.com/premium_photo-1722593856044-e5176ca19a5f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8a3lvdG98ZW58MHx8MHx8fDA%3D",
                          ),
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
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 22,
                        color: Color(0xFFF88C49),
                      ),
                      Text(
                        "Kyoto, Japan",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFFF88C49)),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Fushimi Inari Shrine",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Mountainside Shinto shrine dating from 711 A.D. featuring a path with hundreds of traditional gates.",
                  style: TextStyle(
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
                        label: const Text(
                          "4.8",
                          style: TextStyle(
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
                      )
                    ],
                  ),
                ),
                const Text(
                  "Services in Fushimi Inari Shrine",
                  style: TextStyle(
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
            EdgeInsets.symmetric(
              horizontal: 5,
            ),
          ),
          minimumSize: WidgetStateProperty.all(const Size(150, 50)),
          backgroundColor: WidgetStateProperty.all(
            const Color(0xFFF88C49),
          ),
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
