import 'package:componentes/objectbox.g.dart';
import 'package:componentes/src/pages/dinamic_tasks/add_group_screen.dart';
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
  Future<void> addGroup() async {
    final result = await showDialog(
      context: context,
      builder: (_) => AddGroupScreen(),
    );
    if (result != null) // if el user cemes withaou any changes
    {
      groupBox.put(result);
      loadGroups();
    }
  }

  late final Store store;
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
      groupBox = store
          .box<Groups>(); // los box se usan para interactuar con las entidades,
      // acala variable realiza operaiones sobre los Groups
      loadGroups();
    } catch (ex) {
      showSnackBar(context, ex.toString());
    }
  }
// variable que carga  los grupos desde la BD
  final _groups = <Groups>[];

  @override
  void initState() {
    super.initState();
    loadStore(); // abre la bd
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("there are no groups"),
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
                  //onTap:()=>_gotoTasks(group),
                  onTap: () {},
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
