import 'package:componentes/src/pages/watasapp_Responsive/info.dart';
import 'package:componentes/src/pages/watasapp_Responsive/widgets/my_message_card.dart';
import 'package:componentes/src/pages/watasapp_Responsive/widgets/sender_message_card.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        if (messages[index]["isMe"] == true) {
          return MyMessageCard(
              // my message ->card
              message: messages[index]["text"].toString(),
              date: messages[index]["time"].toString());
        } else {
          // sender message ->card
          return SenderMessageCard(
              message: messages[index]["text"].toString(),
              date: messages[index]["time"].toString()); // my message ->card
        }
      },
    );
  }
}
