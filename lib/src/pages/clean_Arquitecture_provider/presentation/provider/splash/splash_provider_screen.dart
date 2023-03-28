import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  //aqui se crea un construnctor privado que impide que esta clase si instancie
  SplashScreen._();

// aca se crea una fucion estatica que es la que se usara para instanciar la clase y vinculada con el provider necesario
  static Widget init(BuildContext context) {
    return SplashScreen._();// aca habia codigo de un 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: Colors.primaries,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Image.asset('assets/darlin.jpg'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'DeliveryApp',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                    //color: DeliveryColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
