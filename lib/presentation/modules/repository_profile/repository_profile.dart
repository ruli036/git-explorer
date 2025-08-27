import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/presentation/widgets/state_handler.dart';

import 'controller/repository_profile_controller.dart';

class RepositoryProfilePage extends StatelessWidget {
  const RepositoryProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RepositoryProfileController>();
    String username = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
     body: Obx(()=>
       StateHandler(
           onRefresh: () => controller.getRepositoryProfile(username),
           isLoading: controller.loading.value,
           isError: controller.error.value,
           errorView: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text(controller.errorMessage.value,textAlign: TextAlign.center,),
               IconButton(
                 onPressed: () => controller.getRepositoryProfile(username),
                 icon: Icon(Icons.refresh),
               ),
             ],
           ),
           child: SingleChildScrollView(
             padding: const EdgeInsets.all(16),
             child: Column(
               children: [
                 CircleAvatar(
                   radius: 60,
                   backgroundImage: NetworkImage(controller.user.value?.avatarUrl??''),
                 ),
                 const SizedBox(height: 16),
                 Text(
                   controller.user.value?.name ?? controller.user.value?.login ??'',
                   style: const TextStyle(
                     fontSize: 22,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 const SizedBox(height: 8),
                 Text(
                   controller.user.value?.bio ?? "No bio available",
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.grey[700],
                   ),
                   textAlign: TextAlign.center,
                 ),
                 const SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     _buildStatCard("Repos",controller.user.value?.publicRepos,
                         Icons.book_outlined, Colors.blue),
                     _buildStatCard("Followers", controller.user.value?.followers,
                         Icons.people, Colors.green),
                     _buildStatCard("Following", controller.user.value?.following,
                         Icons.person_add, Colors.orange),
                   ],
                 ),
               ],
             ),
           )
       ),
     ),
    );
  }
  Widget _buildStatCard(String title, int? value, IconData icon, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 6),
            Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
