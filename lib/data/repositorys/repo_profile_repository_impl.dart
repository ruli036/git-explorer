import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:github_explorer/app/routes/app_routes.dart';
import 'package:github_explorer/data/datasource/dto/response_user_profile_model.dart';
import 'package:github_explorer/domain/repository/repo_profile_repository.dart';
import 'package:github_explorer/domain/service/repository_profile_service.dart';


class RepoProfileRepositoryImpl implements RepoProfileRepository {
  final RepositoryProfileService remoteDataSource;

  RepoProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserProfile> getRepositoryProfile({String username = 'username'}) async {
    final response = await remoteDataSource.getRepositoryProfile(username: username).timeout(
      Duration(seconds: 6),
    );
    if(response.statusCode != 200){
      Get.defaultDialog(
        title: "Error",
        content: Text(response.bodyString),
        textCancel: 'Close',
        onCancel: (){
          Get.offAllNamed(AppRoutes.repository);
        }
      );
    }
    final result = response.data;
    return result;
  }
}
