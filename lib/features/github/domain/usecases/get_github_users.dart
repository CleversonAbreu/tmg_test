import 'package:tmg_test/features/github/domain/repositories/github_repository.dart';

import '../entities/github_user.dart';

class GetGitHubUsers {
  final GitHubUserRepository repository;

  GetGitHubUsers(this.repository);

  Future<List<GitHubUser>> call({required int since}) {
    return repository.getUsers(since: since);
  }
}
