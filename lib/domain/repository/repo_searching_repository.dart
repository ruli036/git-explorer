import 'package:github_explorer/data/datasource/dto/response_repo_list_model.dart';

abstract class RepoSearchingRepository {
  Future<ResponseRepoList> getRepositoryList({String query = 'query',String page = '1', String size = '10'});
  Future<void> saveRepositoryFavorite(List<Items> repo);
  List<Items> removeRepositoryFavorite(List<Items> repo, int id);
  List<Items> getRepositoryFavorite();
}
