class RepositoryEndPoint {
  static get basePath => "https://api.github.com";

  static getRepoList({String query = 'query',String page = '1', String size = '20'}) {
    return "$basePath/search/repositories?q=$query&page=$page&per_page=$size";
  }
  static getRepoProfile(String username) {
    return "$basePath/users/$username";
  }
}
