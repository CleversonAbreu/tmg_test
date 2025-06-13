import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';


// Data sources
import 'features/github/data/datasources/github_remote_datasource.dart';
import 'features/github/data/datasources/github_remote_datasource_impl.dart';

// Repositories
import 'features/github/data/repositories/github_repository_impl.dart';
import 'features/github/domain/repositories/github_repository.dart';

// Use cases
import 'features/github/domain/usecases/get_github_users.dart';

// Bloc
import 'features/github/presentation/bloc/github_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // External
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://api.github.com',
        headers: {'Accept': 'application/vnd.github.v3+json'},
      ),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<GitHubUserRemoteDatasource>(
    () => GitHubUserRemoteDatasourceImpl(getIt<Dio>()),
  );

  // Repository
  getIt.registerLazySingleton<GitHubUserRepository>(
    () => GitHubUserRepositoryImpl(getIt<GitHubUserRemoteDatasource>()),
  );

  // Use cases
  getIt.registerLazySingleton(
    () => GetGitHubUsers(getIt<GitHubUserRepository>()),
  );

  // Bloc
  getIt.registerFactory(
    () => GitHubUserCubit(getIt<GetGitHubUsers>()),
  );
}