import 'package:componentes/src/pages/dinamic_tasks/tasks.dart';
import 'package:objectbox/objectbox.dart';

@Entity() // para que objectbox cree una tabla con esta clase
class Groups {
  int id =
      0; // tener presente que el id debe estar inicializado, no se pueden usar campos privados, ni contrunctor vacio.
  String name;
  int color;

  @Backlink() //esta anotacion permite que se realzian los cambios en cascada, que cuadnp se pida un gruo venga con sus tareas 
  // para que se encargue de enlazar y crear relaciones un grupo tiene varias tareas
  final tasks = ToMany<Tasks>();
  Groups({required this.color, required this.name});

  String taskDescription() {
    final taskCompleted = tasks.where((taks) => taks.completed).length;
    if (tasks.isEmpty) {
      return '';
    }
    return '$taskCompleted of ${tasks.length}';
  }
}

/** despues de haber creado las clases que se desean persistir hyq ei correr un comando  que genera
 *  las clases necesarias 
 * para que esta bd de dart funcione.  si no fnciona este comandopureba ejecutarlo  conectado a internet
 * comando> flutter pub run build_runner build
 * genera un Json y unaclase... 
 */
