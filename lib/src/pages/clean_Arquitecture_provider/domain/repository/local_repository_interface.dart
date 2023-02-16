import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalRepositoryInterface {
  Future<String> getToken();
  Future<String> saveToken(String token);
  Future<void> clearAllData();
  Future<User> getUser();
  Future<User> saveUser(User user);
  Future<void> saveDarkMode(bool darkmode);
  Future<bool> isDarkMode();
}

class LocalRepositoryInterfaceImpl extends LocalRepositoryInterface {
  String _pref_token = '';

  String _pref_username = '';

  @override
  Future<void> clearAllData() async {
    // TODO: implement clearAllData
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  @override
  Future<String> getToken() async {
    // TODO: implement getToken

    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString(_pref_token) ?? 'nodata';
  }

  @override
  Future<User> getUser() async {
    // TODO: implement getUser
    SharedPreferences pref = await SharedPreferences.getInstance();
    final username = pref.getString(_pref_username) ?? 'no name';
    throw UnimplementedError();
  }

  @override
  Future<bool> isDarkMode() {
    // TODO: implement isDarkMode
    throw UnimplementedError();
  }

  @override
  Future<void> saveDarkMode(bool darkmode) {
    // TODO: implement saveDarkMode
    throw UnimplementedError();
  }

  @override
  Future<String> saveToken(String token) async {
    // TODO: implement saveToken

    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString(_pref_token, token);
    return token;
  }

  @override
  Future saveUser(user) async {
    // TODO: implement saveUser
    SharedPreferences pref = await SharedPreferences.getInstance();

    throw UnimplementedError();
  }
}
