import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/app/routes/app_routes.dart';
import 'package:github_explorer/data/datasource/dto/response_repo_list_model.dart';
import 'package:intl/intl.dart';

class ItemsRepository extends StatelessWidget {
  final Items repo;
  const ItemsRepository({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Get.toNamed(AppRoutes.repositoryDetail,arguments: repo);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                repo.name.toString().toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "by ${repo.owner}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.star, size: 18, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(NumberFormat.decimalPattern('id').format(repo.stargazersCount)),
                  const SizedBox(width: 16),
                  Icon(Icons.call_split, size: 18, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(NumberFormat.decimalPattern('id').format(repo.forksCount)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
