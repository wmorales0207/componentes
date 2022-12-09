import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderGP extends StatefulWidget {
  static const route = 'FutureBuilder';
  const FutureBuilderGP({super.key});

  @override
  State<FutureBuilderGP> createState() => _FutureBuilderGPState();
}

Future<int> getData() async {
  //await Future.delayed(const Duration(seconds: 4));
  final result =
      await http.get(Uri.parse('https://randomnumberapi.com/api/v1.0/random'));
  final body = jsonDecode(result.body);
  int randomnunber = (body as List).first;
  return randomnunber;
}

class _FutureBuilderGPState extends State<FutureBuilderGP> {
  late Future<int> futuredata;

  @override
  void initState() {
    super.initState();
    futuredata = getData();
  }

/** este comportamiento se aprecia cuando la devolucion de es un Future<int?> (permite Null)
 * Cuadno se ejecuta el botton el futue builder realiza una recarga de la informacion . O sea que
 * se ejecuta el el loading entre cada dato.. PERO   el futire conserav el dato anterior hasta que no vemga el proximo
 * en el la ejecucion del future .. cuando se ejecuta pro primera vez el future no tiene info previa q no ser que se defina 
 * en el initial data del future .. En la segunda recarga de la info si conserva el dato anterior en la if (snapshot.connectionState == ConnectionState.waiting) .. aqui.. ahy data la segunda vez
 * por lo que se puede poner codigo que la muestre mientra se recarga por el new data.
 * */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future Builder Godd Practice')),
      body: Center(
        child: FutureBuilder<int>(
          future: futuredata,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState
                  .waiting: // aqui se evidencia que a pesar de que esta waiting conserva el dato anterior, mira el print
                  //si aca no pones cod se moetrara un loading .
                {
                  print(
                      'Waitingdata :  ${snapshot.data}, error: ${snapshot.error}  ');
                  return snapshot.hasData
                      ? _textData(data: snapshot.data!)
                      : const CircularProgressIndicator();
                }

              case ConnectionState.done:

              default:
                if (snapshot.hasError) {
                  return const Text(' Error',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red));
                } else if (snapshot.hasData) {
                  int data = snapshot.data!;
                  return _textData(data: data);
                }
            }
            return const CircularProgressIndicator(
              color: Colors.red,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            futuredata = getData();
          });
          /** este comportamiento se aprecia cuando la devolucion de es un Future<int>  
           * la primera vez ue se ejcuta el metodo get va y trata de recoger la info  y ahi se muestra el loading 
           * cuando se da clic en el boton solo se busca el elemento primero que esta en la lista y no requiere de
           * que se vueva a ejecutar el metodo get por lo que no se vera el loadinggg.
           * se en el Future del future builder se hubese puesto el metodo get y no la variable future data
           * este metodo se recargaria cada vez que se hiciera un rebuild de la UI.
          */
        },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}

class _textData extends StatelessWidget {
  const _textData({
    Key? key,
    required this.data,
  }) : super(key: key);

  final int data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        title: Text(
          data.toString(),
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(
          Icons.gpp_good,
          color: Colors.green,
          size: 40,
        ),
      ),
    );
  }
}
