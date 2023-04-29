import 'package:componentes/src/pages/watasapp_Responsive/colors.dart';
import 'package:componentes/src/pages/watasapp_Responsive/info.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            //si despues de poner la columna para poner el divider no pones el expanded el listvew no se ve
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: info.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  // the row must be clicable to show the txt.
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      title: Text(
                        info[index]["name"].toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          info[index]["message"].toString(),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              info[index]["profilePic"].toString())),
                      trailing: Text(
                        info[index]["time"].toString(),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(
            color: dividerColor,
            indent: 90.0,
            endIndent: 90.0,
            //height: 30,
          )
        ],
      ),
    );
  }
}
