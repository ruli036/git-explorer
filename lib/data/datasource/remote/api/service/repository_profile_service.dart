
import 'package:github_explorer/data/datasource/dto/response_user_profile_model.dart';
import 'package:github_explorer/domain/service/repository_profile_service.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/network/base_api_response.dart';
import '../../handler/handler_restfull_api.dart';
import '../../handler/http_helper.dart';
import '../endpoint/repository_end_point.dart';

class RepositoryProfileServiceDataSourceImpl implements RepositoryProfileService{
  final APIHandler _apiHandler = APIHandler();
  final HttpHelper _httpHelper = HttpHelper();
  final _apiClient = http.Client();

  @override
  Future<BaseApiResponse<UserProfile>> getRepositoryProfile({String username = 'username'}) async {
    return _apiHandler.performApiRequest<UserProfile>(
      request: () => _httpHelper.getAPI(
        client: _apiClient,
        uri: RepositoryEndPoint.getRepoProfile(username),
      ),
      fromJson: (json) {
        return UserProfile.fromJson(json);
      },
    );
  }
}
