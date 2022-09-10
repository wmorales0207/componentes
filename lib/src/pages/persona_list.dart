import 'package:flutter/material.dart';

class PersonList extends StatefulWidget {
  const PersonList({super.key});

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  final List<Persona> PersonList = [
    Persona('bnaxsme', 'lastname', 'huiy87687yjk'),
    Persona('snamxsxe', 'lastname', 'cohg67ihjk'),
    Persona('xsxname', 'lastname', 'c,mkjiu987ijlk'),
    Persona('rrname', 'lastname', '89789x7xc7x'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Person List',
          style: TextStyle(
            fontSize: 30.0,
            backgroundColor: Colors.black12,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: PersonList
            .length, //si al builder no se le define la can el no sabria cuando parar
        itemBuilder: ((context, index) {
          return ListTile(
            title:
                Text('${PersonList[index].name} ${PersonList[index].lastname}'),
            subtitle: Text(PersonList[index].cod),
            leading: CircleAvatar(
              child: Text(PersonList[index].name.substring(0, 1).toUpperCase()),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onLongPress: () {},
          );
        }),
      ),
    );
  }

  _erasePerson(BuildContext context, Persona persona) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Eliminar Contacto'),
              content: Text('Esta persona se debe eliminar a ${persona.name}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Borrar',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ));
  }
}

class Persona {
  String name;
  String lastname;
  String cod;

  Persona(this.name, this.lastname, this.cod);
}
