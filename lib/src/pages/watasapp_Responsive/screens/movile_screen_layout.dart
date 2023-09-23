import 'package:componentes/src/pages/responsive_layout/widgets/contacts_list.dart';
import 'package:componentes/src/pages/watasapp_Responsive/colors.dart';
import 'package:flutter/material.dart';

class MovileScreenLayout extends StatelessWidget {
  const MovileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            //backgroundColor: appbarColor,
            elevation: 0,
            title: const Text(
              "whatsapp",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ),
            ],
            bottom: const TabBar(
                // cuando seleccionas se marca debajo con el color definido
                indicatorColor: tabColor,
                // resalta el color del tab que este seleccionado.
                indicatorWeight: 4,
                //le pone al text el mismo color del tab seleccionado
                labelColor: tabColor,
                // es el color que tendran los tab que no estan seleccionados
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    text: "CHATS",
                  ),
                  Tab(
                    text: "STATUS",
                  ),
                  Tab(
                    text: "CALLS",
                  ),
                ]),
          ),
          backgroundColor: background,
          body: //Center(child: Text("dsds"))
              const ContactList()),
    );
  }
}
