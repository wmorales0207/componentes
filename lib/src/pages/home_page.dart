import 'package:componentes/src/provider/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          // aca puedes poner botones al mismo nivel que el title.
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.cargarData()); // imprime por consola lo que leyo del JSON.
    //print(menuProvider
    //  .opciones); //  aca aunque se hace una llamada a la clase menu provider y su contructor,
    // en la consola no se muesra resultado devido a que el hot reload no crea nuevas instancias y
    //hay que hacer un Hot restart

    /* Nota> Aclarar que aca hay un problema resulta que el constructor de menuProvider 
    se demora en ejecutarse y el ListView se ejecuta antes de que llegue el resultado por
    lo que nunca se pintara en la pantalla el resulatdo esperado. por lo que es necesario el uso del
    Sync Await, en el CArgardata, para que no devuelva el objeto sin el campo Opciones lleno de info
    

    return ListView(
      children: _listaItems(),
    );*/
    return FutureBuilder(
        // debe estar enlazado a lo que se desea obtener, y devuelva un future,
        future: menuProvider.cargarData(),
        initialData: const [], // la info que tendra por defecto mientras no se resuleve el future
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          //print('object');
          //print(snapshot.data);
          return ListView(
            children: _listaItems(),
          );
        });
  }

  List<Widget> _listaItems() {
    return const [
      ListTile(
        title: Text('data'),
      ),
      Divider(
        color: Colors.amberAccent,
      ),
      ListTile(
        title: Text('data'),
      ),
      Divider(
        color: Colors.amberAccent,
      ),
      ListTile(
        title: Text('data'),
      ),
      Divider(
        color: Colors.amberAccent,
      ),
    ];
  }
}
