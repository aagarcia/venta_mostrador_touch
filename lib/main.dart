import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venta_mostrador_touch/screen/screen.dart';
import 'package:venta_mostrador_touch/share_preferences/preferences.dart';

void main() async {
  await Preferences.init();
  return runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Compras IASA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const PrincipalScreen(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/partes',
          child: (context, args) => const ParteScreen(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/maquinarias',
          child: (context, args) => const MaquinariaScreen(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/carrito',
          child: (context, args) => const CarritoScreen(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/partes/detalle',
          child: (context, args) => const DetParteScreem(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
