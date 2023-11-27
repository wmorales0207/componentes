import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/avatar.dart';
import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/models/user.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        //Avatar( photoUrl: user.photoUrl),
        const SizedBox(height: 8.0),
        ...[
          Text(
            user.displayName,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8.0),
        ],
        ...[
          Text(
            user.username,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 8.0),
        ],
      ],
    );
  }
}
