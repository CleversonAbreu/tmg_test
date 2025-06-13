import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmg_test/features/github/domain/usecases/get_github_users.dart';
import '../../domain/entities/github_user.dart';


part 'github_state.dart';

class GitHubUserCubit extends Cubit<GitHubUserState> {
  final GetGitHubUsers getGitHubUsers;
  int _page = 0;
  bool _isLoading = false;
  static const _perPage = 20;

  GitHubUserCubit(this.getGitHubUsers) : super(GitHubUserState.initial());

  Future<void> fetchUsers() async {
    if (_isLoading || state.hasReachedEnd) return;

    _isLoading = true;
    emit(state.copyWith(status: GitHubUserStatus.loading));

    try {
      final users = await getGitHubUsers(since: _page * _perPage);
      
      if (users.isEmpty) {
        emit(state.copyWith(hasReachedEnd: true));
      } else {
        _page++;
        emit(state.copyWith(
          status: GitHubUserStatus.success,
          users: [...state.users, ...users],
          hasReachedEnd: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: GitHubUserStatus.error,
        errorMessage: e.toString(),
      ));
    } finally {
      _isLoading = false;
    }
  }
}