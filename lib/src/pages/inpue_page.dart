import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _pass = '';
  String _fecha = '';
  final List<String> _powerList = ['volar', 'rayos', 'laser'];
  String _opcionSelecionada = 'volar';

  final TextEditingController _inputTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInputs(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          crearDropDown(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInputs() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Cantidad de letras1 ${_nombre.length}'),
        hintText: 'nombre de la persona',
        labelText: 'Nombre',
        helperText: 'solo es el nombre',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.delete),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onChanged: (value) {
        // este evento detecta cada una de las teclas que se aprietan pero no repinta el widget para que se repinte se debe usar el SetState.
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es $_nombre'),
      subtitle: Text('el Email de la persona es $_email'),
      trailing: Text(_opcionSelecionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email@ de la persona',
        labelText: 'Email',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onChanged: (value) {
        // este evento detecta cada una de las teclas que se aprietan pero no repinta el widget para que se repinte se debe usar el SetState.
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Pass de la persona',
        labelText: 'Pass',
        suffixIcon: const Icon(Icons.lock),
        icon: const Icon(Icons.lock_open),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onChanged: (value) {
        // este evento detecta cada una de las teclas que se aprietan pero no repinta el widget para que se repinte se debe usar el SetState.
        setState(() {
          _pass = value;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection:
          false, // no se desea que la persona interactue con el widget
      controller:
          _inputTextEditController, // este campo del textfield es un observador eventos que permite que cuando se genere el evento
      // de clic o que se ejecute algun modal(nueva ventana ) todo lo que se seleccione se puede traer al controller. el controller controla
      // lo que se edita en el txtField.
      decoration: const InputDecoration(
        hintText: 'fecha de nacimiento ',
        labelText: 'fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(
          Icons.calendar_today,
        ),
      ),
      onTap: () {
        // para lograr el efecto de que cuando se toque un componente se inhabilite ,
        // que pierda el foco y poder trabajar con la ventana que se desea que salga  ejemplo... cuando en
        FocusScope.of(context).requestFocus(FocusNode());
        //el campo fecha se quiere que salga un componente que te permita seleccionarla y no tener que escribirla.
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      // como que la funcion showDatePicker devuelve un future <datetime> es encesario el uso de asyn await
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      //locale: const Locale('es', 'ES'), // cuando se anade esta linea Falla.Da
      // el error formatFulldate (necesita el flutter Localization), que se resuelve anadiendo una dependencia en el pubspec
      //flutter_localizations:
      //sdk: flutter
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();

// esta linea no funciona revisar. no se a;ade lo que se selecciona al componente que muestra la fecha.
        _inputTextEditController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getMenuOpt() {
    List<DropdownMenuItem<String>> list = [];
    for (var element in _powerList) {
      list.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    }
    return list;
  }

  Widget crearDropDown() {
    return Expanded(
      // este widget permite expandir tod el combo hasta lo ancho de la app
      child: Row(
        // envolver el DropdownButton en un Row te pemite ponerle children lo que sig
        // poder definirle un conjunto de opciones visuales
        children: <Widget>[
          const Icon(Icons.select_all),
          const SizedBox(
            width: 30.0,
          ),
          DropdownButton(
            value: _opcionSelecionada,
            items: getMenuOpt(),
            onChanged: (value) {
              setState(() {
                _opcionSelecionada = value.toString();
              });
            },
          )
        ],
      ),
    );
  }
}
