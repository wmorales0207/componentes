import 'package:flutter/material.dart';

class PersonList extends StatefulWidget {
  const PersonList({super.key});

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  final List<Persona> PersonList = [
    Persona('Pepe', 'pires', 'huiy87687yjk'),
    Persona('Ricardo', 'peres', 'cohg67ihjk'),
    Persona('mailvi', 'morales', 'c,mkjiu987ijlk'),
    Persona('mene', 'mesa', '89789x7xc7x'),
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
            //es el widget elegido para mostrar los resiltados en una lista
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

//// este metodo esta pensado para borrar una persona de la lista es una caja de dialogo que contruye a otra
  _erasePerson(BuildContext context, Persona persona) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Eliminar Contacto'),
              content:
                  Text('Desea eliminar a ${persona.name}  ${persona.lastname}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: (Colors.red)),
                    
                  ),
                  
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
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
