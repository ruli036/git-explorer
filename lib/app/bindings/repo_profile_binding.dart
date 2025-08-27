import 'package:get/get.dart';
import 'package:github_explorer/data/datasource/remote/api/service/repository_profile_service.dart';
import 'package:github_explorer/data/repositorys/repo_profile_repository_impl.dart';
import 'package:github_explorer/domain/repository/repo_profile_repository.dart';
import 'package:github_explorer/domain/service/repository_profile_service.dart';
import 'package:github_explorer/presentation/modules/repository_profile/controller/repository_profile_controller.dart';

class RepoProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RepositoryProfileController(repoProfileRepository: Get.find()));
    Get.lazyPut<RepoProfileRepository>(() => RepoProfileRepositoryImpl(Get.find()));
    Get.lazyPut<RepositoryProfileService>(() => RepositoryProfileServiceDataSourceImpl());
  }
}