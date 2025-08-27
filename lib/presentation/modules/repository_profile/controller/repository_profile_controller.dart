import 'package:get/get.dart';
import 'package:github_explorer/data/datasource/dto/response_user_profile_model.dart';
import 'package:github_explorer/domain/repository/repo_profile_repository.dart';

class RepositoryProfileController extends GetxController{
  RepoProfileRepository repoProfileRepository;

  RepositoryProfileController({required this.repoProfileRepository});

  var user = Rxn<UserProfile>();
  RxBool loading = true.obs;
  RxBool error = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getRepositoryProfile(Get.arguments);

    super.onInit();
  }

  Future<void> getRepositoryProfile(String username) async {
    loading.value = true;
    error.value = false;
    // try {
      user.value = await repoProfileRepository.getRepositoryProfile(username: username);
    // } catch (e) {
    //   loading.value = false;
    //   error.value = true;
    //   errorMessage.value = "$e";
    // }
    loading.value = false;
  }
}