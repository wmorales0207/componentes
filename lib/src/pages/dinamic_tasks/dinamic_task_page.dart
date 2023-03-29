import 'package:componentes/src/pages/dinamic_tasks/groups.dart';
import 'package:componentes/src/pages/dinamic_tasks/tasks.dart';
import 'package:flutter/material.dart';

import '../../../objectbox.g.dart';

class DinamicTaskPage extends StatefulWidget {
  final Groups group;
  final Store store;

  const DinamicTaskPage({super.key, required this.group, required this.store});

  @override
  State<DinamicTaskPage> createState() => _DinamicTaskPageState();
}

class _DinamicTaskPageState extends State<DinamicTaskPage> {
  final textController = TextEditingController();
  final List<Tasks> tasks = []; //  ambas fomas de declarar lo mismo
  //final task = <Tasks>[];

  @override
  void initState() {
    // aca se cargan las tareas que vienen del grupo seleccionado.
    tasks.addAll(List.from(widget.group.tasks));
    super.initState();
  }

  void onSave() {
    // se carga la task y se recontruyen todas las relaciones que necesita para ser persistida.
    final description = textController.text.trim();
    if (description.isNotEmpty) {
      textController.clear();
      final otraTask = Tasks(completed: false, description: description);
      otraTask.group.target = widget.group;
      widget.store.box<Tasks>().put(otraTask);
      reloadtasks();
    }
  }

// este metodo permite recargar las tareas por medio de una consulta relaizada a la BD
  void reloadtasks() {
// esta linea permite que se puedan armar querys
    QueryBuilder<Tasks> builder = widget.store.box<Tasks>().query();
    // este objeto TAsk_.. viene de algun lugar, no fue creado por mi, pero es el que permite
    // ellacceso a las propiedades para realizar las consultas.
    builder.link(Tasks_.group, Groups_.id.equals(widget.group.id));

    Query<Tasks> query = builder.build();
    List<Tasks> taskResult = query.find();

// clear data de la lista
    tasks.clear();
    // a;adde todos los elementos de la consulta y con el set state se logra mostrar en pantalla lo guardado
    setState(() {
      tasks.addAll(taskResult);
    });

// cerrar la consulta.
    query.close();
  }

  void onDelete(Tasks task) {
    widget.store.box<Tasks>().remove(task.id);
    // es necesario recargar las tareas despues de la modificacion.
    reloadtasks();
  }

  void onUpdate(int index, bool completed) {
    final updatetasks = tasks[index];
    updatetasks.completed = completed;
    widget.store.box<Tasks>().put(updatetasks);

    reloadtasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.group.name}/'s Tasks")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            /// texto de las Tasks
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: "tasks",
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            // Button to aadd the tasks
            MaterialButton(
              color: Colors.blue,
              onPressed: onSave,
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Create Task",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10.0),

            // mostrando las tareas de los grupos
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final Task = tasks[index];
                  return ListTile(
                    title: Text(
                      Task.description,
                      style: TextStyle(
                        decoration:
                            Task.completed ? TextDecoration.lineThrough : null,
                      ),
                    ),
// Mostrando ls tareas cumplidas y las no cumplidas
                    leading: Checkbox(
                      value: Task.completed,
                      onChanged: (value) => onUpdate(index, value!),
                    ),
                    trailing: IconButton(
                        onPressed: () => onDelete(Task),
                        icon: const Icon(Icons.close)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
