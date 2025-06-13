import 'package:flutter/material.dart';
import '../../domain/entities/github_user.dart';

class ProfilePage extends StatelessWidget {
  final GitHubUser user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.login)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.avatarUrl)),
            const SizedBox(height: 16),
            Text(user.login, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
