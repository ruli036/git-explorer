import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:github_explorer/app/routes/app_routes.dart';
import 'package:github_explorer/core/helpers/helpers.dart';
import 'package:github_explorer/data/datasource/dto/response_repo_list_model.dart';
import 'package:intl/intl.dart';

import 'controller/repository_searching_controller.dart';

class RepositoryDetailPage extends StatelessWidget {
  const RepositoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RepositorySearchingController>();
    final Items repoDetail = Get.arguments as Items;
    controller.save.value = controller.repoFavorite.any(
      (e) => e.id == repoDetail.id,
    );
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(repoDetail.name.toString().toUpperCase()),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (!controller.save.value) {
                  controller.saveRepositoryAsFavorite(repoDetail);
                  controller.save.value = true;
                } else {
                  controller.removeRepositoryFavorite(repoDetail);
                  controller.save.value = false;
                }
              },
              icon: Icon(
                controller.save.value
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                size: 18,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.repositoryProfile,arguments: repoDetail.owner?.login);
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          repoDetail.owner?.avatarUrl ?? '',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                repoDetail.fullName ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                "@${repoDetail.owner!.login}",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidStar,
                      size: 18,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "${NumberFormat.decimalPattern('id').format(repoDetail.stargazersCount)} Stars",
                    ),
                    const SizedBox(width: 20),
                    Icon(
                      FontAwesomeIcons.codeFork,
                      size: 18,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "${NumberFormat.decimalPattern('id').format(repoDetail.forksCount)} Forks",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  repoDetail.description ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed(AppRoutes.repositoryProfile,arguments: repoDetail.owner?.login),
                  icon: const Icon(Icons.account_circle),
                  label: const Text("View Profile"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 6,),
                ElevatedButton.icon(
                  onPressed: () => launchUrlExternal(repoDetail.htmlUrl ?? ''),
                  icon: const Icon(Icons.open_in_new),
                  label: const Text("View on GitHub"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
