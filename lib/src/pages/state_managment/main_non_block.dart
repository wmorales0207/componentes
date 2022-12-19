import 'package:componentes/src/pages/state_managment/counter_repository.dart';
import 'package:flutter/material.dart';

//// esta clase se encarga de realizar la logica que se defina y notificar a los que esten suscritos. Usa la interfaz y no la implementacion.
class MainNonBlock extends ChangeNotifier {
  int counter = 0;

  final CounterRepository counterRepository;

  MainNonBlock(this.counterRepository);

  Future<void> increment() async {
    counter = await counterRepository.process(counter);
      notifyListeners();
  }
}
