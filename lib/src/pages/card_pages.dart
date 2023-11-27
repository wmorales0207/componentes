import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Page'),
      ),
      body: ListView(
        // ignore: sort_child_properties_last
        children: <Widget>[
          _cardTipo1(),
          const SizedBox(
            height: 30.0,
          ),
          // _cardTipo2(),
        ],
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 0.0,

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              20.0)), // trabaj con los bordes de las tarjetas
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('aca esta la tarjeta'),
            subtitle: Text('this is the subtitle'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('OK'),
              ),
            ],
          ),
        ],
      ),
    );
  }

// este metodo no funciono dice que no detecto el HOST en la uri.
  Widget _cardTipo2() {
    final card = Container(
      // el card se cambio a continer para ajustar mejor lo que se observa

      child: Column(
        children: <Widget>[
          // este widget garantiza una imagen previa que se mostrara mientras no se carga la imagen que se desea.
          const FadeInImage(
            placeholder:
                AssetImage('assets/darling.jpg'), // este no me funciona
            image: NetworkImage(
                'data:image/jpeg;base64,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'),
            //image: AssetImage('assets/download'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.contain,
          ),

          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('new txto'),
          ),
        ],
      ),
    );
    return Container(
      // esto se hace para aprobechar las ventajas de un container para
      // modificar lo que se ve dentro del mismo.

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            //boton con degradado
            color: Colors
                .black26, // pusimos color negro con indice de opacidad de 26
            blurRadius: 10.0, // tama;o de la sombra
            spreadRadius: 10.0, // que tanto se extiende la sombra
            offset: Offset(10.0, 10.0), // determina la pos de la sombra
          ),
        ],
      ),
      child: ClipRect(
        child: card,
      ),
    );
  }
}
