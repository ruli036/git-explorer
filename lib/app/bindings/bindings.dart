import 'package:get/get.dart';
import 'package:github_explorer/data/datasource/local/local_storage_service.dart';
import 'package:github_explorer/data/datasource/remote/api/service/repository_profile_service.dart';
import 'package:github_explorer/data/repositorys/repo_profile_repository_impl.dart';
import 'package:github_explorer/domain/repository/repo_profile_repository.dart';
import 'package:github_explorer/domain/service/local_repository_service.dart';
import 'package:github_explorer/domain/service/repository_profile_service.dart';

import '../../data/datasource/remote/api/service/repository_searching_service.dart';
import '../../data/repositorys/repo_searching_repository_impl.dart';
import '../../domain/repository/repo_searching_repository.dart';
import '../../domain/service/repository_searching_service.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    /// repository

    /// repo profile

  }
}