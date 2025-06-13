import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:tmg_test/features/github/domain/entities/github_user.dart';
import 'package:tmg_test/features/github/domain/usecases/get_github_users.dart';
import 'package:tmg_test/features/github/presentation/bloc/github_cubit.dart';

class MockGetGitHubUsers extends Mock implements GetGitHubUsers {}

void main() {
  late MockGetGitHubUsers mockUseCase;

  setUp(() {
    mockUseCase = MockGetGitHubUsers();
  });

  final tUsers = [
    const GitHubUser(id: 1, login: 'creh', avatarUrl: 'https://example.com/avatar1.png'),
    const GitHubUser(id: 2, login: 'user2', avatarUrl: 'https://example.com/avatar2.png'),
  ];

  blocTest<GitHubUserCubit, GitHubUserState>(
    'emits [loading, success] when fetchUsers succeeds',
    build: () {
      when(() => mockUseCase(since: 0)).thenAnswer((_) async => tUsers);
      return GitHubUserCubit(mockUseCase);
    },
    act: (cubit) => cubit.fetchUsers(),
    expect: () => [
      const GitHubUserState(
        status: GitHubUserStatus.loading,
        users: [],
        hasReachedEnd: false,
      ),
      GitHubUserState(
        status: GitHubUserStatus.success,
        users: tUsers,
        hasReachedEnd: false,
      ),
    ],
  );
}
