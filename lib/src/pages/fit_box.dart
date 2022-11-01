import 'package:flutter/material.dart';

class BoxContain extends StatelessWidget {
  const BoxContain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fitted Box"),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: const CircleAvatar(
                backgroundColor: Colors.black54,
                child: Text('JL'),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  color: Colors.brown,
                  child: const FadeInImage(
                    image: AssetImage('assets/download.gif'),
                    placeholder: AssetImage('assets/download.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(right: 60),
                padding: EdgeInsets.all(15),
                height: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Colors.indigo,
                ),
                child: const Text(
                  'disco duro G',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 26, 25, 23),
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 100,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: const FittedBox(
                    // este logra ajustar el contenido de su hijo segun la opcion de BixFit que se haya elegido
                    fit: BoxFit
                        .contain, // esta ajusta el contenido al tamaño del container
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              10), // con el padding logramos que no se peque a los bordes
                      // pero se forman 2 lineas sino cabe el contenido
                      child: Text(
                        '\$331331.90', // poniendo el / delante del simbolo $ no lo detecta como var y lo deja pasar como  parte del string

                        style: TextStyle(
                          color: Colors.white12,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
