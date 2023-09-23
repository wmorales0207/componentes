import 'dart:io';

import 'package:flutter/material.dart';

class UrlLauncherPage extends StatelessWidget {
  static const route = 'UrlLauncherPage';
  const UrlLauncherPage({super.key});

  @override
  Widget build(BuildContext context) {

openWhatsApp()async{
  var whatsapp = '+54603076';
  // check if we are using IOS Android
  if(Platform.isAndroid){
    

  }else if (Platform.isIOS){

  }
  //var url = 


}
  
    return Scaffold(
        appBar: AppBar(title: const Text('Url Launcher')),
        body: Center(
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.sms),
                label: const Text('Mensaje SMS'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.email),
                label: const Text('Email'),
              ),
              TextButton.icon(
                onPressed: () {
                  openWhatsApp();
                  
                },
                icon: const Icon(Icons.other_houses),
                label: const Text('Whatsapp'),
              ),
            ],
          ),
        ));
  }
}
