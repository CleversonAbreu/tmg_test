import 'package:tmg_test/features/github/data/datasources/github_remote_datasource.dart';
import 'package:tmg_test/features/github/domain/repositories/github_repository.dart';

import '../../domain/entities/github_user.dart';


class GitHubUserRepositoryImpl implements GitHubUserRepository {
  final GitHubUserRemoteDatasource remoteDatasource;

  GitHubUserRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<GitHubUser>> getUsers({required int since}) {
    return remoteDatasource.getUsers(since: since);
  }
}
