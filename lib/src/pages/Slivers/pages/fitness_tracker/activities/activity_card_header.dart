import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/avatar.dart';
import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/models/activity.dart';
import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/models/user.dart';
import 'package:flutter/material.dart';

class ActivityCardHeader extends StatelessWidget {
  const ActivityCardHeader(
      {super.key, required this.user, required this.activity});
  final User user;
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //Avatar(radius: 15),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              user.displayName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              activity.dateTime,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        )
      ],
    );
  }
}
