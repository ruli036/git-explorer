import 'package:github_explorer/data/datasource/local/local_key.dart';
import 'package:github_explorer/domain/service/local_repository_service.dart';

import '../../domain/repository/repo_searching_repository.dart';
import '../../domain/service/repository_searching_service.dart';
import '../datasource/dto/response_repo_list_model.dart';

class RepoSearchingRepositoryImpl implements RepoSearchingRepository {
  final RepositorySearchingService remoteDataSource;
  final LocalRepositoryService localDataSource;

  RepoSearchingRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<ResponseRepoList> getRepositoryList({String query = 'query',String page = '1', String size = '10'}) async {
    final response = await remoteDataSource.getRepositoryList(query: query,page: page,size: size).timeout(
      Duration(seconds: 6),
    );
    final result = response.data;
    return result;
  }

  @override
  Future<void> saveRepositoryFavorite(List<Items> repo) {
    return localDataSource.saveRepoList(repo,key: LocalKeys.repoFavorite);
  }

  @override
  List<Items> getRepositoryFavorite() {
    return localDataSource.getRepoList(LocalKeys.repoFavorite);
  }

  @override
  List<Items> removeRepositoryFavorite(List<Items> repo, int id){
    return localDataSource.removeRepoList(repo, id);
  }
}
