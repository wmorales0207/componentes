import 'package:componentes/src/pages/dinamic_tasks/groups.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Tasks {
  // no se deben usar campos imutables, ni privados
  // usando anotaciones se puede cambiar el identificador a String u otros
  int id =
      0; // tener presente que el id debe estar inicializado, no se pueden usar campos privados, ni contrunctor vacio.
  String description;
  bool completed;

  final group = ToOne<Groups>(); //
  Tasks({required this.completed, required this.description});

  /**
   * Despues de haber puesto las anotaciones correctas es necesario la ejecucion de un comando en el la terminal.
   * este comando permite que se creen las relaciones(flutter pub run build_runner build)
   * 
   * este genera un Json y un generator.
   * Si se genera esta error
   * SEVERE] Conflicting outputs were detected and the build is unable to prompt for permission to remove them.
   *  These outputs must be removed manually or the build can be run with `--delete-conflicting-outputs`. 
   * The outputs are: lib/objectbox.g.dart
   * se resuelve usando o a;adiendo al comando : flutter pub run build_runner build --delete-conflicting-outputs
   */
}
