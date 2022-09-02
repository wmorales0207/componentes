import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/provider/menu_provider.dart';
import 'package:componentes/src/utils/icono_strings.dart';
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
            children: _listaItems(snapshot.data, context),
          );
        });
  }

  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];

    if (data == null) {
      return [];
    } // al recibir un List<dynamic>? data que podrias ser null me obliga a verificarlo.

    data.forEach((element) {
      final Widget temp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element[
            'icon']), // se lee del Json un string y con el metodo se le asigna el icon semidinamicamente

        trailing: const Icon(
          Icons.keyboard_arrow_right_outlined,
          color: Colors.green,
        ),
        onTap: () {

          Navigator.pushNamed(context, element['ruta']);// segun 


          /* final route =
              MaterialPageRoute(builder: (context) => const AlertPage());

          Navigator.push(
              context, route);*/ // el navigator necesita el context y la route
          //(  el context contiene toda la info del entorno, del arbol de widget
          //
          // ) y una ruta.
          //en este caso el context lo tenia ya en el future builder y solo lo pase como
          // un parametro mas del metodo
        },
      );
      opciones.add(temp);
      opciones.add(const Divider());
    });
    return opciones;
  }
}
