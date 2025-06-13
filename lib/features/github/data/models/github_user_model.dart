import '../../domain/entities/github_user.dart';

class GitHubUserModel extends GitHubUser {
  const GitHubUserModel({required super.id, required super.login, required super.avatarUrl});

  factory GitHubUserModel.fromJson(Map<String, dynamic> json) {
    return GitHubUserModel(
      id: json['id'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}
