import 'package:github_explorer/core/network/base_api_response.dart';
import 'package:github_explorer/data/datasource/dto/response_repo_list_model.dart';

abstract class RepositorySearchingService {
  Future<BaseApiResponse<ResponseRepoList>> getRepositoryList({String query = 'query',String page = '1', String size = '10'});
}
