import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:venta_mostrador_touch/share_preferences/preferences.dart';

class ParteScreen extends StatefulWidget {
  const ParteScreen({Key? key}) : super(key: key);

  @override
  State<ParteScreen> createState() => _ParteScreenState();
}

class _ParteScreenState extends State<ParteScreen> {
  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth ~/ 300;
    debugPrint('crossAxisCount: $crossAxisCount');
    return crossAxisCount;
  }

  Widget _buildCard(BuildContext context, int index) {
    return Card(
      elevation: 1,
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                border: Border.all(width: 5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Image.network(
                'https://dummyimage.com/400x250/000/fff',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: AutoSizeText(
              'Title $index',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 8),
            child: Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: const Size(120, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Modular.to.navigate('/partes/detalle');
                },
                child: const AutoSizeText(
                  'Mas detalles',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText(
          'IASA S.A.',
        ),
        centerTitle: true,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Modular.to.navigate('/');
          },
        ),
        actions: <Widget>[
          Badge(
            label: Text('${Preferences.carrito.length}'),
            backgroundColor: Colors.red,
            child: IconButton(
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
                          Modular.to.pop();
                        },
                        child: const AutoSizeText(
                          'Volver',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const AutoSizeText(
              'Partes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: _getCrossAxisCount(context),
                children: List.generate(30, (index) {
                  return _buildCard(context, index);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
