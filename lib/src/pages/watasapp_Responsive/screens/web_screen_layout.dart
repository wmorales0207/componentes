import 'package:componentes/src/pages/responsive_layout/widgets/contacts_list.dart';
import 'package:componentes/src/pages/watasapp_Responsive/widgets/chat_list.dart';
import 'package:componentes/src/pages/watasapp_Responsive/widgets/web_chat_app_bar.dart';
import 'package:componentes/src/pages/watasapp_Responsive/widgets/web_profile_bar.dart';
import 'package:componentes/src/pages/watasapp_Responsive/widgets/web_search_bar.dart';
import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                WebProfilebar(),
                WebSearchbar(),
                ContactList(),
              ],
            ),
          ),
        ),
        // webScreen
        Container(
          width: MediaQuery.of(context).size.width * 0.60,
          //width: MediaQuery.of(context).size.width*0.70 esta linea sig que ocuparia el 70 % de la pantalla
          //teniendo en cuenta de que esta usando el media query,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/whatsapp/whatsappBackground.jpg'))),
          child: const Column(
            children: [
              WebChatAppBar(),
              ChatList(),
              // text messagebox
            ],
          ),
        ),
      ],
    ));
  }
}
