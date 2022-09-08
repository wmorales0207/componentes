import 'package:flutter/material.dart';

class ContainedPage extends StatelessWidget {
  const ContainedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container17'),
      ),
      body: Center(
        child: Container(
          height: 200.0,
          width: 200.0,
          padding: EdgeInsets.all(
              40.0), // este paddin afecta al child dentro dal container.

          //color: Colors.lightBlue,// si defines un decoration debes desabilitar esta propiedad
          decoration: BoxDecoration(
            // si defines un deoration debes definir tambienen color inside the decoration
            // borderRadius: BorderRadius.circular(
            //     15.0), // miestras mayor es el numero mayor se redondean las puntas, claro es n container cuadtradp
            //color: Colors.deepPurpleAccent,
            //shape: BoxShape.circle,
            border: Border.all(color: Colors.black12, width: 12.0),

            //shape: BoxShape.circle  //aca podemos definir que sea circulo.. y ya el cuadrado se convierte en un circulo
            borderRadius: BorderRadius.circular(
                10.0), // un rectangulo con las esquinas ovaladas
          ),
          child: Center(child: const Text('Testing')),// el center l ppone al centro ignorando el padding.
        ),
      ),
    );
  }
}
