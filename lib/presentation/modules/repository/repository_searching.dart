import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/presentation/modules/repository/widget/search_form.dart';
import 'package:github_explorer/presentation/widgets/state_handler.dart';

import 'controller/repository_searching_controller.dart';
import 'widget/items_repository.dart';

class RepositorySearchingPage extends StatelessWidget {
  const RepositorySearchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RepositorySearchingController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              SizedBox(height: 8,),
              SearchForm(),
              SizedBox(height: 4,),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => controller.getRepositoryList(),
                  child: StateHandler(
                    onRefresh: () => controller.getRepositoryList(),
                    isEmpty: controller.itemRepo.isEmpty,
                    isLoading: controller.loading.value,
                    isError: controller.error.value,
                    errorView: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(controller.errorMessage.value,textAlign: TextAlign.center,),
                        IconButton(
                          onPressed: () => controller.getRepositoryList(),
                          icon: Icon(Icons.refresh),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      controller: controller.scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: controller.itemRepo.length + 1,
                      itemBuilder: (context, index) {
                        if (index >= controller.itemRepo.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        final repo = controller.itemRepo[index];
                        return ItemsRepository(repo: repo);
                      },
                    )
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
