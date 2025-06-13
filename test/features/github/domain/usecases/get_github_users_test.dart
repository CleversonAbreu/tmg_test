import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmg_test/features/github/domain/entities/github_user.dart';
import 'package:tmg_test/features/github/domain/repositories/github_repository.dart';
import 'package:tmg_test/features/github/domain/usecases/get_github_users.dart';

class MockGitHubUserRepository extends Mock implements GitHubUserRepository {}

void main() {
  late GetGitHubUsers usecase;
  late MockGitHubUserRepository mockRepository;

  setUp(() {
    mockRepository = MockGitHubUserRepository();
    usecase = GetGitHubUsers(mockRepository);
  });

  final tUsers = [
    GitHubUser(id: 1, login: 'creh', avatarUrl: 'https://example.com/avatar.png'),
    GitHubUser(id: 2, login: 'dev', avatarUrl: 'https://example.com/dev.png'),
  ];

  test('should return a list of GitHub users from the repository', () async {
    // arrange
    when(() => mockRepository.getUsers(since: 0))
        .thenAnswer((_) async => tUsers);

    // act
    final result = await usecase(since: 0);

    // assert
    expect(result, equals(tUsers));
    verify(() => mockRepository.getUsers(since: 0)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
