import 'package:componentes/src/settings/sreens/setting_page2.dart';
import 'package:flutter/material.dart';

Drawer crearMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero, // sube completo el componente hasta arriba,
      children: [
        DrawerHeader(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.pages,
            color: Colors.blue,
          ),
          title: const Text('Pages'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.people,
            color: Colors.red,
          ),
          title: const Text('People'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            color: Colors.purple,
          ),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context); // this line close the menu
            Navigator.pushNamed(
                context, SettingPage2.routeName); // and this open the new page
            //Navigator.pushReplacementNamed(context, SettingPage2.routeName); // thi line erase all the tree you cant go bact , all the tree is deleted
          },
        ),
      ],
    ),
  );
}
