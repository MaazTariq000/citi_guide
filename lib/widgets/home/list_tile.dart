import 'package:flutter/material.dart';
import 'package:myapp/modal/list_item.dart';

class ListTimeHome extends StatelessWidget {
  ListTimeHome({super.key});

  final List<ListItem> items = [
    ListItem(
        title: "Cafe Ignite",
        category: "Restaurant",
        location: "Saint Paulo, Milan, Italy",
        rating: 4.0,
        reviews: 37,
        price: "\$40/Night",
        imageUrl:
            "https://kaapimachines.com/wp-content/uploads/2023/06/cafe-chain-3-1.png"),
    ListItem(
      title: "Sky Lounge",
      category: "Bar",
      location: "New York, USA",
      rating: 4.5,
      reviews: 120,
      price: "\$50/Night",
      imageUrl:
          "https://lasinfoniavietnam.com/wp-content/uploads/2023/06/Terraco-view-1.jpg",
    ),
    ListItem(
      title: "Ocean View",
      category: "Restaurant",
      location: "Miami, USA",
      rating: 4.8,
      reviews: 85,
      price: "\$60/Night",
      imageUrl:
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/75/88/a8/ocean-view-beach-hotel.jpg?w=700",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: items.map((item) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(item.imageUrl),
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
                    Text(
                      item.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(102, 255, 153, 0),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(117, 163, 100, 5),
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        item.category,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Color.fromARGB(255, 163, 100, 5),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            item.location,
                            style: const TextStyle(
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
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.yellow,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item.rating.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "${item.reviews} Reviews",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          item.price,
                          style: const TextStyle(
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
                color: Color.fromARGB(124, 158, 158, 158),
                thickness: 1.0,
                indent: 10.0,
                endIndent: 10.0,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
