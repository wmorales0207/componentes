import 'package:componentes/src/pages/watasapp_Responsive/colors.dart';
import 'package:componentes/src/pages/watasapp_Responsive/info.dart';
import 'package:flutter/material.dart';

class WebChatAppBar extends StatelessWidget {
  const WebChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.090,
        width: MediaQuery.of(context).size.width * 0.75,
        //padding: const EdgeInsets.all(10.0),
        color: webAppbarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://via.placeholder.com/300x400"),
                  radius: 30.0,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(info[0]["name"].toString(),
                    style: const TextStyle(fontSize: 14.0)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
