import 'package:componentes/src/pages/watasapp_Responsive/colors.dart';
import 'package:flutter/material.dart';

class WebProfilebar extends StatelessWidget {
  const WebProfilebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.090,
        width: MediaQuery.of(context).size.width * 0.60,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(color: dividerColor),
          ),
          color: webAppbarColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage:
                  NetworkImage("https://via.placeholder.com/300x400"),
            ),
            // para lograr un buen trabajo con los responsive se uso el row  con el spaceBetween
            // para lograr un estiramiento o encogimiento bueno....
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment, color: Colors.grey)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
