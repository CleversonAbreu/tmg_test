part of 'github_cubit.dart';

enum GitHubUserStatus { initial, loading, success, error }

class GitHubUserState extends Equatable {
  final GitHubUserStatus status;
  final List<GitHubUser> users;
  final bool hasReachedEnd;
  final String? errorMessage;

  const GitHubUserState({
    required this.status,
    required this.users,
    required this.hasReachedEnd,
    this.errorMessage,
  });

  factory GitHubUserState.initial() => const GitHubUserState(
        status: GitHubUserStatus.initial,
        users: [],
        hasReachedEnd: false,
      );

  GitHubUserState copyWith({
    GitHubUserStatus? status,
    List<GitHubUser>? users,
    bool? hasReachedEnd,
    String? errorMessage,
  }) {
    return GitHubUserState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, users, hasReachedEnd, errorMessage];
}
