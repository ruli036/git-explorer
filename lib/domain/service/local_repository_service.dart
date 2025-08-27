import 'package:github_explorer/data/datasource/dto/response_repo_list_model.dart';

abstract class LocalRepositoryService {
  Future<void> saveRepoList(List<Items> repository, {String key});
  List<Items> getRepoList(String key);
  List<Items> removeRepoList(List<Items> repository, int id);
}
