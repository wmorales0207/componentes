import 'package:componentes/src/settings/sreens/setting_page2.dart';
import 'package:flutter/material.dart';

Drawer crearMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero, // sube completo el componente hasta arriba,
      children: [
        DrawerHeader(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.pages,
            color: Colors.blue,
          ),
          title: Text('Pages'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.people,
            color: Colors.red,
          ),
          title: Text('People'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.purple,
          ),
          title: Text('Settings'),
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
