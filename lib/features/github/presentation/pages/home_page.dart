import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmg_test/features/github/presentation/pages/profile_dart.dart';
import '../bloc/github_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _GitHubUserPageState();
}

class _GitHubUserPageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // Carrega os usuários iniciais
    context.read<GitHubUserCubit>().fetchUsers();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isLoading) return;
    
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent * 0.8) {
      _isLoading = true;
      context.read<GitHubUserCubit>().fetchUsers().then((_) {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Users'),
      ),
      body: BlocBuilder<GitHubUserCubit, GitHubUserState>(
        builder: (context, state) {
          if (state.status == GitHubUserStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == GitHubUserStatus.error) {
            return Center(
              child: Text(state.errorMessage ?? 'Error loading users'),
            );
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: state.hasReachedEnd
                ? state.users.length
                : state.users.length + 1,
            itemBuilder: (context, index) {
              if (index >= state.users.length) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final user = state.users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                title: Text(user.login),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(user: user),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}