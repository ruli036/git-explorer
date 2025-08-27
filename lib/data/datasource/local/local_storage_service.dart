import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:github_explorer/data/datasource/dto/response_repo_list_model.dart';
import 'package:github_explorer/domain/service/local_repository_service.dart';

class LocalStorageServiceImpl implements LocalRepositoryService{
  final GetStorage box = GetStorage();

  @override
  Future<void> saveRepoList(List<Items> repository,{String key = 'repository-favorite'}) async {
    final jsonList = repository.map((repo) => repo.toJson()).toList();
    box.write(key, jsonEncode(jsonList));
  }

  @override
  List<Items> removeRepoList(List<Items> repository, int id) {
    repository.removeWhere((item) => item.id == id);
    return repository;
  }

  @override
  List<Items> getRepoList(String key) {
    final jsonString = box.read(key);
    if (jsonString == null) return [];

    final List decoded = jsonDecode(jsonString);
    return decoded.map((item) => Items.fromJson(item)).toList();
  }
}
