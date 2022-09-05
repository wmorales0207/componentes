import 'package:flutter/material.dart';

class SliderPAge extends StatefulWidget {
  const SliderPAge({super.key});

  @override
  State<SliderPAge> createState() => _SliderPAgeState();
}

class _SliderPAgeState extends State<SliderPAge> {
  double _sliderValue = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders1'),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            top: 10.0), // separacion en la parte superior del Slider
        child: Column(
          children: <Widget>[
            _creaSlider(),
            _crearImagen(),
          ],
        ),
      ),
    );
  }

  Widget _creaSlider() {
    return Expanded(
      child: Slider(
        activeColor: Colors.indigo,
        label: 'Tamano de la image',
        //divisions: 20, divide el slider en posiciones
        min: 10.0,
        max: 400.0,
        value: 10.0,
        onChanged: (value) {
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
}
