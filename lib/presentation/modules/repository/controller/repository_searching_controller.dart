import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:github_explorer/data/datasource/dto/response_repo_list_model.dart';
import 'package:github_explorer/domain/repository/repo_searching_repository.dart';

class RepositorySearchingController extends GetxController {
  final RepoSearchingRepository repoSearchingRepository;

  RepositorySearchingController({required this.repoSearchingRepository});

  var repoResponse = Rxn<ResponseRepoList>();
  RxList<Items> itemRepo = <Items>[].obs;
  RxList<Items> repoFavorite = <Items>[].obs;
  RxBool loading = true.obs;
  RxBool save = false.obs;
  bool loadMore = true;
  RxBool error = true.obs;
  RxString errorMessage = ''.obs;
  int page = 1;
  int size = 20;
  final RxString query = 'query'.obs;
  final TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    getRepositoryList();
    getRepositoryFavorite();
    debounce(query, (_) {
      page = 1;
      getRepositoryList();
    }, time: const Duration(milliseconds: 500));
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        final totalCount = repoResponse.value?.totalCount ?? 0;
        if ((page * size) < totalCount && !loading.value) {
          page++;
          loadMore = true;
          getRepositoryList(loadMore: loadMore);
        } else {
          loadMore = false;
        }
      }
    });
    super.onInit();
  }

  Future<void> getRepositoryList({bool loadMore = false}) async {
    loading.value = loadMore ? false : true;
    error.value = false;
    try {
      repoResponse.value = await repoSearchingRepository.getRepositoryList(
        page: page.toString(),
        query: query.value,
        size: size.toString(),
      );
      if (loadMore) {
        itemRepo.addAll(repoResponse.value?.items ?? []);
      } else {
        itemRepo.assignAll(repoResponse.value?.items ?? []);
      }
    } catch (e) {
      loading.value = false;
      error.value = true;
      errorMessage.value = "$e";
    }
    loading.value = false;
  }

  List<Items> getRepositoryFavorite() {
    repoFavorite.value = repoSearchingRepository.getRepositoryFavorite();
    return repoFavorite;
  }

  Future<void> saveRepositoryAsFavorite(Items newRepo) async {
    List<Items> repo = getRepositoryFavorite();
    if(!repo.any((e)=>e.id == newRepo.id)){
      repo.addAll({newRepo});
      await repoSearchingRepository.saveRepositoryFavorite(repo);
    }
  }

  Future<void> removeRepositoryFavorite(Items newRepo) async {
    List<Items> repo = getRepositoryFavorite();
    if(repo.any((e)=>e.id == newRepo.id)){
      repo =  repoSearchingRepository.removeRepositoryFavorite(repo, newRepo.id??0);
      await repoSearchingRepository.saveRepositoryFavorite(repo);
      getRepositoryFavorite();
    }
  }
}
