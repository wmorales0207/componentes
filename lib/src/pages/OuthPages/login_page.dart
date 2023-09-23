import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const route = 'OuthFirebase';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// en los metodos cuando e usa un future si que se queda esperando por los resultado  de los mismos
  /// para ejecutar lo que viene a conuntinuacion.
  /// 
  void signIN() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    print('before future');
    await Future.delayed(const Duration(seconds: 5));
    print('waiting por futre');
    Navigator.pop(context);
    print('close future');
  }

  final controllerUserName = TextEditingController();

  final controllerUserPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                // Logo
                const Icon(
                  Icons.lock,
                  size: 90,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome back you ve been missed',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Username  textfield
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    key: const Key("Username"),
                    controller: controllerUserName,
                    decoration: const InputDecoration(
                      label: Text('user'),
                      prefixIcon: Icon(Icons.verified_user),
                      hintText: 'User Name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // password textfield
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    key: const Key("passname"),
                    obscureText: true,
                    controller: controllerUserPass,
                    decoration: const InputDecoration(
                      hintText: 'password',
                    ),
                  ),
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'You forgot the password?',
                        style: TextStyle(
                            fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                // Sign in Button
                InkWell(
                  onTap: () {
                    /** parece ue el inkwell cuando pones un metodod con () este no se ejecuta instantaneamnete cuando el compilador 
                     * pasas por el , en otros casos no se le pone el () pues si se pone se ejecuta son dar el clic., Revisar por que pasa esto ...
                     */
                    signIN();
                  },
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Or continue with',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      color: Colors.white,
                      child: const Icon(
                        Icons.report_gmailerrorred,
                        size: 70,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                      height: 80,
                      width: 80,
                      color: Colors.white,
                      child: const Icon(
                        Icons.ios_share,
                        size: 70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
