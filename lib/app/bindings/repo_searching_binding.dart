import 'package:get/get.dart';
import 'package:github_explorer/data/datasource/local/local_storage_service.dart';
import 'package:github_explorer/data/datasource/remote/api/service/repository_searching_service.dart';
import 'package:github_explorer/data/repositorys/repo_searching_repository_impl.dart';
import 'package:github_explorer/domain/repository/repo_searching_repository.dart';
import 'package:github_explorer/domain/service/local_repository_service.dart';
import 'package:github_explorer/domain/service/repository_searching_service.dart';
import 'package:github_explorer/presentation/modules/repository/controller/repository_searching_controller.dart';

class RepoSearchingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RepositorySearchingController(repoSearchingRepository: Get.find()));
    Get.lazyPut<RepoSearchingRepository>(() => RepoSearchingRepositoryImpl(Get.find(),Get.find()));
    Get.lazyPut<RepositorySearchingService>(() => RepositorySearchingServiceDataSourceImpl());
    Get.lazyPut<LocalRepositoryService>(() => LocalStorageServiceImpl());
  }
}