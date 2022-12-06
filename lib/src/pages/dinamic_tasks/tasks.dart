import 'package:componentes/src/pages/dinamic_tasks/groups.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Tasks {
  int id =
      0; // tener prsente que el id debe estar inicializado, no se pueden usar campos privados, ni contrunctor vacio.
  String description;
  bool completed;

  final group = ToOne<Groups>();
  Tasks({required this.completed, required this.description});
}
