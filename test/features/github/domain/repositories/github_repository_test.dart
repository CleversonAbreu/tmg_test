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

  final tSince = 0;
  final tUsers = [
    GitHubUser(id: 1, login: 'creh', avatarUrl: 'https://example.com/avatar.png'),
    GitHubUser(id: 2, login: 'user2', avatarUrl: 'https://example.com/avatar2.png'),
  ];

  test('should get list of GitHub users from the repository', () async {
    // arrange
    when(() => mockRepository.getUsers(since: tSince))
        .thenAnswer((_) async => tUsers);

    // act
    final result = await usecase(since: tSince);

    // assert
    expect(result, equals(tUsers));
    verify(() => mockRepository.getUsers(since: tSince)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
