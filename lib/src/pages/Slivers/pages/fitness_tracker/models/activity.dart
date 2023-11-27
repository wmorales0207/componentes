import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/models/split.dart';


class Activity {
  const Activity({
    required this.dateTime,
    required this.distance,
    required this.pace,
    required this.time,
    required this.description,
    required this.splits,
  });
  final String dateTime;
  final String distance;
  final String pace;
  final String time;
  final String description;
  final List<Split> splits;
}
