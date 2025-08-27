import 'package:flutter/material.dart';
import 'package:github_explorer/presentation/modules/repository/repository_favorite.dart';
import 'package:github_explorer/presentation/modules/repository/repository_searching.dart';

class RepositoryPage extends StatelessWidget {
  const RepositoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text("GitHub Explorer"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.search), text: "Searching"),
              Tab(icon: Icon(Icons.favorite), text: "Favorite"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RepositorySearchingPage(),
            RepositoryFavoritePage(),
          ],
        ),
      ),
    );
  }
}
