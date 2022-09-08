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
          height: 300.0,
          width: 300.0,
          //alignment: Alignment.bottomCenter,
          alignment: Alignment(-1,
              1), // tambien se le pasan valores por defecto al cntructor. (-1,-1) esquina inferior derecha, entre -1 y 1 doubeles son lo limites

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
          child: const Text(
            'Testing',
            //textAlign: TextAlign.right,
            style: TextStyle(fontSize: 30.0),
          ), // con el textAlign: TextAlign.right, de text tambien se puede definir posicion dentro de un contained
        ),
      ),
    );
  }
}
