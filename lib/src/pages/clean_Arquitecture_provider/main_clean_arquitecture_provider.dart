import 'package:componentes/src/pages/clean_Arquitecture_provider/domain/repository/local_repository_interface.dart';
import 'package:componentes/src/pages/clean_Arquitecture_provider/presentation/common/theme.dart';
import 'package:componentes/src/pages/clean_Arquitecture_provider/presentation/provider/splash/splash_provider_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainCleanArquitectureProvider extends StatelessWidget {
  const MainCleanArquitectureProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // aca  al provder del tipo LocalRepositoryInterface  injectamele la implementacion LocalRepositoryInterfaceImpl
        // Si se desea realizar lo test pue se cambia LocalRepositoryInterfaceImpl(),=> LocalRepositoryInterfaceMock y no se afecta el test
        Provider<LocalRepositoryInterface>(
          create: (context) => LocalRepositoryInterfaceImpl(),
        ),
      ],
      child: MaterialApp(
        theme: ligthTheme,
        home: SplashScreen.init(context),
      ),
    );
  }
}
