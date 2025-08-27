import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/presentation/widgets/state_handler.dart';

import 'controller/repository_searching_controller.dart';
import 'widget/items_repository.dart';

class RepositoryFavoritePage extends StatelessWidget {
  const RepositoryFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RepositorySearchingController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: controller.repoFavorite.length,
                      itemBuilder: (context, index) {
                        final repo = controller.repoFavorite[index];
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
