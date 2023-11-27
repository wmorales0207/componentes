import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            () => _mostrarAlerta(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            shape: const StadiumBorder(),
          ),
          child: const Text('Mostrar Alerta'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.handshake),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          true, // Este campo define si se cerrara con clic fuera
      // funcion encargada de crear el pop up de la alerta
      builder: (context) {
        return AlertDialog(
          //definiendo los detalles de shape
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Text('Texto'),
          content: const Column(
            mainAxisSize: MainAxisSize.min, // ajusta el modal a tama;o minimo
            children: <Widget>[
              Text('Este es el contenido de la caja'),
              FlutterLogo(
                size: 100.0,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .pop(), // de esta manera devolvemos el controla al widget que la creo
              child: const Text('OK'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // de esta manera devolvemos el controla al widget que la creo
              },
              child: const Text('CANCELAR'),
            ),
          ],
        );
      },
    );
  }
}
