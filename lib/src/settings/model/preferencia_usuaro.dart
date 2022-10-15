import 'package:shared_preferences/shared_preferences.dart';

//// this classs is for save the preferences.
class UserPreference {
  static final UserPreference _instance = UserPreference._internal();
// the most important is where you should use the class, where make the instantietion.
// aca se realiza una implementacion de un singlenton , ya que solo tendra una instancia.
  UserPreference._internal();

  factory UserPreference() {
    return _instance;
  }
  late SharedPreferences _pref; // cuano se vaya a usar debera tener un valor

  initPreference() async {
    _pref =
        await SharedPreferences.getInstance(); // this method laod all the data
  }

  get genero {
    return _pref.getInt('genero') ?? 1;
  }

  set genero(var value) {
    _pref.setInt('genero', value);
  }

  bool get colorSecundario {
    return _pref.getBool('color_Secundario') ?? false;
  }

  set colorSecundario(bool value) {
    _pref.setBool('color_Secundario', value);
  }

  String get nombre {
    return _pref.getString('nombre') ?? 'Pedro';
  }

  set nombre(String nombre) {
    _pref.getString('nombre');
  }

// esta esla forma de guardar la ultima pag en la que se quedo el user la ultima vez que uso la app

  String get ultimaPagina {
    return _pref.getString('ultimaPagina') ?? '/';  // si nunca ha entrado pues por dfecto estara la pag inicial.
  }

  set ultimaPagina(String ultimaPagina) {
    _pref.getString('ultimaPagina');
  }

  // bool? _color_Secundario;
  // int? _genero;
  // String? _nombre;
}
