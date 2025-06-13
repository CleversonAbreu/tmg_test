import 'package:equatable/equatable.dart';

class GitHubUser extends Equatable {
  final int id;
  final String login;
  final String avatarUrl;

  const GitHubUser({
    required this.id,
    required this.login,
    required this.avatarUrl,
  });

  @override
  List<Object> get props => [id, login, avatarUrl];
}
