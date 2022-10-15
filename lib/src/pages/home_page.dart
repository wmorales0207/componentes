import 'package:componentes/src/pages/Account.dart';
import 'package:componentes/src/pages/person_page.dart';
import 'package:componentes/src/pages/setting_page.dart';
import 'package:componentes/src/provider/menu_provider.dart';
import 'package:componentes/src/settings/widgets/menu_widget.dart';
import 'package:componentes/src/utils/icono_strings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  final List<Widget> _WidgetList = const [
    SettingPage(),
    AccountPage(),
    PersonPage(),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: crearMenu(context),
        appBar: AppBar(
          title: const Text(
            'Componentes Todos',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          backgroundColor: Colors.deepPurple[300],
          elevation: 0, // no da sombra debajo del App bar
          // leading: IconButton(
          //   // va delante del tittle del appbar
          //   onPressed: () {},
          //   icon: const Icon(Icons.menu),
          // ),
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
        body: _lista()
        //(_selectedIndex == 0)
        //     ? _lista()
        //     : _WidgetList[
        //         _selectedIndex], // si seleciona el 0 carga a home sino cualquiera de las demas pages
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex:
        //       _selectedIndex, // esta properties define el que esta activo.
        //   onTap:
        //       _navigateBottonBar, // este metodo no tiene el () para que no se ejecute con el hilo de ejecucion,
        //   items: const [
        //     // este componente da error si se le pone menos de 2 elementos, y si se le pone mas  de 3
        //     // hay que definirle mas la propertie type: BottomNavigationBarType.fixed. sino se   no se ven en el botton.
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //     BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        //   ],
        //   type: BottomNavigationBarType.fixed,
        // ),
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
    Sync Await, en el CArgardata, para que no devuelva el objeto sin el campo Opciones este lleno de info
    

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
          Navigator.pushNamed(context, element['ruta']); // segun

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

  void _navigateBottonBar(int value) {
    // en el OnTap viene el ID del Item al que se le hizo clic.
    // apoyandose con la property currentIndex selecciona el BottomNavigationBarItem al que se le hace clic.
    setState(() {
      _selectedIndex = value;
    });
  }
}
