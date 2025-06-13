import '../models/github_user_model.dart';

abstract class GitHubUserRemoteDatasource {
  Future<List<GitHubUserModel>> getUsers({required int since});
}
