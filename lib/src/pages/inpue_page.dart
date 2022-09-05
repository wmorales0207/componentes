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
  String? _fecha = '';

  final _inputTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInputs(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
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
      controller: _inputTextEditController,
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
    DateTime? _picked = await showDatePicker(
      // como que la funcion showDatePicker devuelve un future <datetime> es encesario el uso de asyn await
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );
    setState(() {
      _fecha = (_picked != null) ? _picked.toString() : null;
      _inputTextEditController = _fecha;
    });
  }
}