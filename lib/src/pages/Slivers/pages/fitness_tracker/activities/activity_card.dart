import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/activities/activity_card_body.dart';
import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/activities/activity_card_header.dart';
import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/models/activity.dart';
import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/models/user.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.user, required this.activity});
  final User user;
  final Activity activity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const Divider(color: Colors.black12, height: 0.5),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildContent(),
            ),
            const Divider(color: Colors.black12, height: 0.5),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ActivityCardHeader(user: user, activity: activity),
        const SizedBox(height: 16.0),
        ActivityCardBody(activity: activity),
        const SizedBox(height: 16.0),
        //ActivitySplits(activity.splits),
      ],
    );
  }
}
