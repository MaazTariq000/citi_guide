import 'package:flutter/material.dart';

class ListTimeHome extends StatelessWidget {
  const ListTimeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.orange,
              ),
            ),
            title: Row(
              children: [
                const Text(
                  "Cafe Ignite",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(102, 255, 153, 0),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(117, 163, 100, 5),
                      width: 1.0,
                    ),
                  ),
                  child: const Text(
                    "Restuarant",
                    style: TextStyle(
                      fontSize: 9,
                      color: Color.fromARGB(255, 163, 100, 5),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              ],
            ),
            subtitle: const Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 14,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "Saint Paulo, Milan, Italy",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "4.0",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "37 Reviews",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "40\$/Night",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            // Horizontal line
            color: Color.fromARGB(124, 158, 158, 158), // Color of the line
            thickness: 1.0, // Thickness of the line
            indent: 10.0, // Left padding of the line
            endIndent: 10.0, // Right padding of the line
          ),
        ],
      ),
    );
  }
}
