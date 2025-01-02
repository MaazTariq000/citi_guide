import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/helpers.dart';

class AdminItemList extends StatelessWidget {
  final String title;
  final dynamic navLink;
  // final
  const AdminItemList({super.key, required this.title, required this.navLink});
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
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    Get.toNamed(navLink);
                  },
                  label: const Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.edit,
                    size: 16,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  color: Colors.white,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    confirmDialog("Are you sure?",
                        "Do you want to delete this?", "Delete", () {});
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
