import 'package:flutter/material.dart';
import 'package:myapp/utils/helpers.dart';

class AdminItemList extends StatelessWidget {
  final String title;
  final String description;
  final String address;
  final String rating;
  final dynamic navLink;
  final VoidCallback delete;
  final VoidCallback edit;

  const AdminItemList({
    super.key,
    required this.title,
    required this.navLink,
    required this.description,
    required this.delete,
    required this.edit,
    required this.address,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: edit,
                  label: const Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.edit,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.red,
                    ),
                  ),
                  onPressed: () {
                    confirmDialog(
                      "Are you sure?",
                      "Do you want to delete this?",
                      "Delete",
                      () {
                        delete(); 
                        Navigator.pop(context);
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
