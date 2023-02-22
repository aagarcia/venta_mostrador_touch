import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:venta_mostrador_touch/share_preferences/preferences.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText(
          'IASA S.A.',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50),
              child: SizedBox(
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 250),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Icon(
                        Icons.build,
                        color: Colors.white,
                        size: 150,
                      ),
                      onPressed: () {
                        Modular.to.navigate('/partes');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AutoSizeText(
                      'Partes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 200),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Icon(
                        Icons.front_loader,
                        color: Colors.white,
                        size: 100,
                      ),
                      onPressed: () {
                        Modular.to.navigate('/maquinarias');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AutoSizeText(
                      'Maquinarias',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 200),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (Preferences.carrito.isNotEmpty) {
                          Modular.to.navigate('/carrito');
                        } else {
                          Dialogs.materialDialog(
                            color: Colors.white,
                            msg:
                                'Debe seleccionar primero los productos para ingresar al carrito',
                            title: 'Mensaje Informativo',
                            lottieBuilder: Lottie.asset(
                              'assets/alert.json',
                              fit: BoxFit.contain,
                            ),
                            context: context,
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  Modular.to.navigate('/partes');
                                },
                                child: const AutoSizeText(
                                  'Ir a partes',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                      child: Badge(
                        label: Text(
                          '${Preferences.carrito.length}',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        largeSize: 50,
                        backgroundColor: Colors.red,
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AutoSizeText(
                      'Carrito de Compras',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
