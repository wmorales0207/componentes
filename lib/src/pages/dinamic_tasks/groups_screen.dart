import 'package:componentes/objectbox.g.dart';
import 'package:componentes/src/pages/dinamic_tasks/add_group_screen.dart';
import 'package:componentes/src/pages/dinamic_tasks/dinamic_task_page.dart';
import 'package:componentes/src/pages/dinamic_tasks/groups.dart';
import 'package:componentes/src/utils/utils.dart';
import 'package:flutter/material.dart';

class GroupsScreen extends StatefulWidget {
  static const route = 'GroupsScreen';
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  // estos metodos en los que se trabaja esta BD devolveran Future
  Future<void> addGroup() async {
    // se hace una llamada a AddGroupScreen con un show dialog ya que se necesita trabajar con el resutado de esa pantalla
    final result = await showDialog(
      context: context,
      builder: (_) => AddGroupScreen(),
    );
    // se realiza la insercion del grupo...en la BD
    if (result != null &&
        result is Groups) // if el user comes without any changes
    {
      groupBox.put(result);
      loadGroups();
    }
  }

// Se identifica como la BD , la cual debe ser abierta in el initstate o inicializada
  late final Store store;
// los groups son como las tablas, que no pueden ser usadas si la bd no ha sido abierta.
  late final Box<Groups> groupBox;

  void loadGroups() {
    _groups.clear();
    setState(() {
      // para que refresque los widgets
      _groups.addAll(groupBox.getAll());
    });
  }

  Future<void> loadStore() async {
    try {
      store = await openStore(); // se abre la coexion a al BD
      //showSnackBar(context, "${store.isClosed()}");
      groupBox = store
          .box<Groups>(); // los box se usan para interactuar con las entidades,
      // acala variable realiza operaiones sobre los Groups

      loadGroups();
    } catch (ex) {
      showSnackBar(context, ex.toString());
    }
  }

  Future<void> goToTasks(Groups groups) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DinamicTaskPage(group: groups, store: store),
      ),
    );
    // permite actualzar la cant de tasks
    loadGroups();
  }

// variable que carga  los grupos desde la BD
  final _groups = <Groups>[];

  @override
  void initState() {
    loadStore(); // abre la bd

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("there are no groups"),
        //leading: IconButton(onPressed:() =>Navigator.of(context).push(MaterialPageRoute(builder: ()=>DinamicTaskPage(group: group, store: store))) , icon: Icon(Icons.add_task)),
      ),
      body: _groups.isEmpty
          ? const Center(
              child: Text('There are no groups'),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _groups.length,
              itemBuilder: (BuildContext context, int index) {
                final group = _groups[index];

                return _GroupItem(
                  onTap: () => goToTasks(group),
                  group: group,
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add Group'),
        onPressed: () async {
          var result = await showDialog(
            context: context,
            builder: (_) => AddGroupScreen(),
          );

          try {
            if (result != null &&
                result is Groups) // if el user cemes withaou any changes

            {
              final res = groupBox.put(result); //anado a la bd
              // print(res.isOdd);
              //loadGroups();
              _groups.clear(); // clean the old data
              setState(() {
                // para que refresque los widgets
                _groups.addAll(groupBox
                    .getAll()); // update the data and the set state update the widget
              });
            }
          } catch (ex) {
            showSnackBar(context, ex.toString());
          }
        },
      ),
    );
  }
}

class _GroupItem extends StatelessWidget {
  final Groups group;
  final VoidCallback onTap;
  _GroupItem({super.key, required this.group, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final description = group.taskDescription();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Color(group.color),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                group.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
