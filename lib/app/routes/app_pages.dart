import 'package:get/get.dart';
import 'package:github_explorer/app/bindings/repo_profile_binding.dart';
import 'package:github_explorer/app/bindings/repo_searching_binding.dart';
import 'package:github_explorer/app/routes/app_routes.dart';
import 'package:github_explorer/presentation/modules/repository/repository.dart';
import 'package:github_explorer/presentation/modules/repository_profile/repository_profile.dart';
import 'package:github_explorer/presentation/modules/repository/repository_detail.dart';
class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.repositorySearching,
      transition: Transition.rightToLeft,
      binding: RepoSearchingBinding(),
      page: () => RepositoryPage()
    ),
    GetPage(
      name: AppRoutes.repositoryDetail,
      transition: Transition.rightToLeft,
      page: () => RepositoryDetailPage()
    ),
    GetPage(
      name: AppRoutes.repositoryProfile,
      transition: Transition.rightToLeft,
      binding: RepoProfileBinding(),
      page: () => RepositoryProfilePage()
    ),
  ];
}