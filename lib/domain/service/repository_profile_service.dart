import 'package:github_explorer/core/network/base_api_response.dart';
import 'package:github_explorer/data/datasource/dto/response_user_profile_model.dart';

abstract class RepositoryProfileService {
  Future<BaseApiResponse<UserProfile>> getRepositoryProfile({String username = 'username'});
}
