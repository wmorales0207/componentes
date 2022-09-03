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
            child: Text('Mostrar Alerta'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey,
              shape: StadiumBorder(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.handshake),
        ));
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // sta campo define si se cerrara con clic fuera
      // funcion encargada de crar el pop up de la alerta
      builder: (context) {
        return AlertDialog(//definiendo los detalles de shape
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),

          ),
          title: const Text('Texto'),
          content: Column(
            mainAxisSize: MainAxisSize.min, // ajusta el modal a tama;o minimo
            children: const <Widget>[
              Text('Este es elcontenido de la caja'),
              FlutterLogo(
                size: 100.0,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('CANCELAR'),
            ),
          ],
        );
      },
    );
  }
}
