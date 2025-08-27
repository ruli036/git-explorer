import 'package:github_explorer/data/datasource/dto/response_user_profile_model.dart';

abstract class RepoProfileRepository {
  Future<UserProfile> getRepositoryProfile({String username = 'username'});
}
