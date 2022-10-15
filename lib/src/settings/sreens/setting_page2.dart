import 'package:componentes/src/settings/model/preferencia_usuaro.dart';
import 'package:componentes/src/settings/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingPage2 extends StatefulWidget {
  const SettingPage2({super.key});

  static const routeName = 'SettingPage2';

  @override
  State<SettingPage2> createState() => _SettingPage2State();
}

class _SettingPage2State extends State<SettingPage2> {
  // la idea es que con las preferencias seteo estas variabls que son las que controlan
  // el comportamiento de de los componentes. Cuando cambia el valor de las variables se disparan los eventos
  // que modifican el estado.
  late bool _colorSecundario;
  late var _genero;
  String _nombre = 'Pedro';

  late TextEditingController _textEditingController;

  final _userPreference =
      UserPreference(); // dentro estan las preferencias de usuario

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: _nombre);
    //textEditingController = new textEditingController(text: _nombre);
    //TextEditingController? textEditingController;  // de esta forma decimo ue la variable puede ser null y no nicesita inicializarse
    //cargarPreferencias(); // este metodo carga las preferencias y no se le debe poner asyng al InitSTATE
    _genero = _userPreference.genero; // cargando el genero de las preferencias.
    _colorSecundario = _userPreference.colorSecundario;
    _nombre = _userPreference.nombre;
  }

  // void cargarPreferencias() async {
  //   SharedPreferences pref =
  //       await SharedPreferences.getInstance(); // no hay await sin asyn
  //   _genero = pref.getInt('genero') ?? 1;
  //   _nombre = pref.getString('nombre') ?? 'Pedro';
  //   _colorsecundario = pref.getBool('colorsecundario') ?? false;

  //   setState(() {
  //     // esto solo es necesario para que refresque el valor de _genero, ya que el init state se ejecuta y como get int es un future
  //     //se demora mas
  //     //osea que el ser actualiza el valor de genero en los radio.
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ajustes',
        ),
      ),
      drawer: crearMenu(context),
      body: ListView(
        // by default make scroll

        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              'Setting',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          SwitchListTile(
            value: true,
            title: const Text('Color Secundario'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                _userPreference.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value:
                1, // ambos RadioListTile tienen en mismo valor por lo que eso los hace excluyentes
            groupValue:
                _genero, // the raio is consider selected if the group value = value
            onChanged: _selectedradio,

            title: const Text('Masculino'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            onChanged: _selectedradio,
            title: const Text('Femenino'),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller:
                  _textEditingController, // aca asociamos el controller al conponente, Como en el init se ejectuto y se asigno el valor de la var nombre pues el texfiel lo coge.
              decoration: const InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono',
              ),
              onChanged: (value) {
                // we neet the value edited so I neet the value.
              },
            ),
          ),
        ],
      ),
    );
  }

  void _selectedradio(Object? value) {
    _genero = value ?? 1;
    _userPreference.genero = value;
    // como es un int? hay que usar el ! porque sabemos que el valor viene siempre.
    // guarda objetos del tipo clave valor. y devuelve un future

    setState(() {});
  }
}
