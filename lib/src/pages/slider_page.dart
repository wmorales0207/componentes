import 'package:flutter/material.dart';

class SliderPAge extends StatefulWidget {
  const SliderPAge({super.key});

  @override
  State<SliderPAge> createState() => _SliderPAgeState();
}

class _SliderPAgeState extends State<SliderPAge> {
  double _sliderValue = 100.0;

  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders'),
      ),
      body: Column(
        children: <Widget>[
          _creaSlider(),
          _crearCheckBox(),
          Expanded(child: _crearImagen()),
        ],
      ),
    );
  }

  Widget _creaSlider() {
    return Expanded(
      child: Slider(
        activeColor: Colors.indigo,
        label: 'Tamano de la image',
        //divisions: 20, divide el slider en posiciones
        min: 0.0,
        max: 100.0,
        value: 10.0,
        onChanged: (_bloquearCheck)
            ? null
            : (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
      ),
    );
  }

  Widget _crearImagen() {
    return Image(
      image: const AssetImage('assets/darling.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (value) {
    //     // si el on change se le pone null este se dasabilita.
    //     setState(() {
    //       _bloquearCheck = value!;
    //       // esta variable es del tipo que permite
    //       //null u con el indicador ! le estoy  diciendo que lo que recibe siempre tendra valor
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: const Text('Bloquear Sliders'),
      value: _bloquearCheck,
      onChanged: (value) {
        // si el on change se le pone null este se dasabilita.
        setState(() {
          _bloquearCheck = value!;
          // esta variable es del tipo que permite
          //null u con el indicador ! le estoy  diciendo que lo que recibe siempre tendra valor
        });
      },
    );
  }
}
