import 'package:dio/dio.dart';
import 'package:tmg_test/features/github/data/datasources/github_remote_datasource.dart';
import 'package:tmg_test/features/github/data/models/github_user_model.dart';

class GitHubUserRemoteDatasourceImpl implements GitHubUserRemoteDatasource {
  final Dio dio;

  GitHubUserRemoteDatasourceImpl(this.dio);

  @override
  Future<List<GitHubUserModel>> getUsers({required int since}) async {
    final response = await dio.get('https://api.github.com/users',
      queryParameters: {'since': since, 'per_page': 20},
    );

    return (response.data as List)
        .map((json) => GitHubUserModel.fromJson(json))
        .toList();
  }
}
