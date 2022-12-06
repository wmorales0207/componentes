import 'package:componentes/src/pages/dinamic_tasks/add_group_screen.dart';
import 'package:componentes/src/pages/dinamic_tasks/groups.dart';
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
      builder: (_) => const AddGroupScreen(),
    );
    if (result != null) // if el user cemes withaou any changes
    {}
  }

  final _groups = <Groups>[];
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
          Groups result = await showDialog(
            context: context,
            builder: (_) => const AddGroupScreen(),
          );
          print('results is: ${result.name}');
          if (result != null) // if el user cemes withaou any changes
          {
            
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
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Color(group.color),
            borderRadius: BorderRadius.all(
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
