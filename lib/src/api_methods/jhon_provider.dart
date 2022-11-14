import 'package:componentes/src/utils/error_handling.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ExampleProvider extends ChangeNotifier {
  final _baseUrl = 'identitytoolkit.googleapis.com';
  final _firebasetoken = 'AIzaSyB7MYFattitIG8CWc1qWxOW8IsGRYm3E8o';

  void methodGetHttp({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var otrauri =
          Uri.https(_baseUrl, '/v1/accounts:signgUp', {'key': _firebasetoken});
      print('otra uri-> $otrauri');

      var aux = Uri(
          scheme: 'https',
          host: _baseUrl,
          path: '/v1/accounts:signgUp?key=$_firebasetoken}');
      print('print Uri ->$aux');

      http.Response res = await http.post(
        otrauri,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
      );
      //final Map<String, dynamic> decodedResp = json.decode(res.body);
      //print(' printny decodcres p-> $decodedResp');
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          // Provider.of<JoinUserProvider>(context, listen: false)
          //     .setUser(res.body);
          // await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          // Navigator.pushReplacementNamed(
          //   context,
          //   HomeFirstTimePage.route,
          //);
        },
      );
    } catch (e) {
      Map<String, dynamic> errorDecoded = jsonDecode(e.toString());

      print(
          'Error message ->${errorDecoded['message']} /n error type-> ${errorDecoded['runtimetype']}');
    }
  }
}
