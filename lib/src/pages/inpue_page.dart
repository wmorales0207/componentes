import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';

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
          Divider(),
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
        counter: Text('Cantidad de letras ${_nombre.length}'),
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
    );
  }
}
