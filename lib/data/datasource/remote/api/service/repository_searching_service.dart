
import 'package:http/http.dart' as http;

import '../../../../../core/network/base_api_response.dart';
import '../../../../../domain/service/repository_searching_service.dart';
import '../../../dto/response_repo_list_model.dart';
import '../../handler/handler_restfull_api.dart';
import '../../handler/http_helper.dart';
import '../endpoint/repository_end_point.dart';

class RepositorySearchingServiceDataSourceImpl implements RepositorySearchingService{
  final APIHandler _apiHandler = APIHandler();
  final HttpHelper _httpHelper = HttpHelper();
  final _apiClient = http.Client();

  @override
  Future<BaseApiResponse<ResponseRepoList>> getRepositoryList({String query = 'query',String page = '1', String size = '10'}) async {
    return _apiHandler.performApiRequest<ResponseRepoList>(
      request: () => _httpHelper.getAPI(
        client: _apiClient,
        uri: RepositoryEndPoint.getRepoList(query: query,page: page, size: size),
      ),
      fromJson: (json) {
        return ResponseRepoList.fromJson(json);
      },
    );
  }
}
