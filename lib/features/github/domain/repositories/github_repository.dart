import 'package:tmg_test/features/github/domain/entities/github_user.dart';

abstract class GitHubUserRepository {
  Future<List<GitHubUser>> getUsers({required int since});
}
