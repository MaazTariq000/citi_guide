import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/search_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final SearchesController controller = Get.put(SearchesController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Search Here...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  color: Colors.orange,
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    controller.fetchSearchResults(searchController.text.trim());
                  },
                ),
              ),
              onSubmitted: (value) {
                controller.fetchSearchResults(value.trim());
              },
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.orange,
              ));
            }
            if (controller.searchResults.isEmpty) {
              return const Expanded(
                child: Center(child: Text('No results found')),
              );
            }
            return Expanded(
              child: ListView.builder(
                itemCount: controller.searchResults.length,
                itemBuilder: (context, index) {
                  final result = controller.searchResults[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      leading: const CircleAvatar(),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.orange,
                      ),
                      title: Text(
                        result['name'] ?? 'No Name',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                          result['description'] ?? 'No Description Available'),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
