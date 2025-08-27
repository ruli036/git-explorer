import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/repository_searching_controller.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RepositorySearchingController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.grey),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller.searchController,
                onChanged: (value) {
                  controller.query.value = value;

                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (controller.searchController.text.isNotEmpty) {
                  controller.searchController.clear();
                  controller.query.value = 'query';
                  FocusScope.of(context).unfocus();
                }
              },
              child: controller.searchController.text.isNotEmpty
                  ? Icon(Icons.close, color: Colors.grey)
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
