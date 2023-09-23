import 'package:componentes/src/pages/dinamic_tasks/groups.dart';
import 'package:flutter/material.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({super.key});

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  Color selectedColor = Colors.primaries.first;

  final textEditingController = TextEditingController();

  void onsave() {
    final name = textEditingController.text;
    if (name.isEmpty) {
      setState(() {
        errorMessage = 'Name is require';
      });
      return;
    } else {
      setState(() {
        errorMessage = null;
      });
    }
    final group =
        Groups(color: selectedColor.value, name: textEditingController.text);
    Navigator.of(context).pop(group);
  }

// var para identificar en pantalla si el user no entro el nombre del grupo.
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 30,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // paint the Selected Color and enter Group Name
            SizedBox(
              child: Container(
                color: selectedColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.group, size: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: textEditingController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Group name',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Color Selection... and underlined

            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          errorMessage ?? '',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Text(
                        'SelectColor',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    // con estos Expanded se logra el mismo efecto que un singleChildScrollView
                    Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: Colors.primaries.length,
                        itemBuilder: (BuildContext context, int index) {
                          final color = Colors.primaries[index];

                          return Padding(
                            key: UniqueKey(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedColor = color;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: color,
                                //radius: 30.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Save color an group name

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          final name = textEditingController.text.trim();
                          if (name.isEmpty) {
                            setState(() {
                              errorMessage = 'Name is require';
                            });
                            return;
                          } else {
                            setState(() {
                              errorMessage = null;
                            });
                          }
                          final group = Groups(
                              color: selectedColor.value,
                              name: textEditingController.text);
                          Navigator.of(context).pop(group);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Create Group'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
