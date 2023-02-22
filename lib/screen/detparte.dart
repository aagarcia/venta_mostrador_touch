import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:uuid/uuid.dart';
import 'package:venta_mostrador_touch/model/carrito.dart';
import 'package:venta_mostrador_touch/share_preferences/preferences.dart';

class DetParteScreem extends StatefulWidget {
  const DetParteScreem({Key? key}) : super(key: key);

  @override
  State<DetParteScreem> createState() => _DetParteScreemState();
}

class _DetParteScreemState extends State<DetParteScreem> {
  int _cantidad = 0;
  CarritoModel _carrito = CarritoModel();
  final Uuid _id = const Uuid();
  List<String> _listCarrito = [];

  @override
  void initState() {
    setState(() {
      _listCarrito = Preferences.carrito;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText(
          'IASA S.A.',
        ),
        centerTitle: true,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Modular.to.navigate('/partes');
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
        padding: const EdgeInsets.all(10),
        child: Card(
          color: Colors.grey.shade200,
          elevation: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: size.width,
                child: Image.network('https://dummyimage.com/400x250/000/fff'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    'Title',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    'Excepteur occaecat voluptate reprehenderit cillum aliqua. Occaecat id do labore officia. Quis esse duis do consequat pariatur. Ad aliqua nostrud qui nostrud. Sit laboris pariatur eu laboris ut ea. Deserunt dolor eiusmod duis incididunt commodo nulla. Cillum mollit culpa adipisicing ipsum magna id dolor culpa veniam nostrud sint cillum minim.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const <Widget>[
                      AutoSizeText(
                        'Precio:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(width: 20),
                      AutoSizeText(
                        '\$ 1586.30',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const AutoSizeText(
                        'Cantidad:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _cantidad++;
                          });
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      AutoSizeText(
                        '$_cantidad',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_cantidad > 0) {
                              _cantidad--;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(180, 20),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: _cantidad > 0
                          ? () {
                              setState(() {
                                _carrito = CarritoModel(
                                  id: _id.v1(),
                                  cantidad: _cantidad,
                                  valorUnitario: 12.5,
                                  valorTotal: (12.5 * _cantidad),
                                );

                                _listCarrito.add(_carrito.toRawJson());

                                Preferences.carrito = _listCarrito;
                                Modular.to.navigate('/partes');
                              });
                            }
                          : null,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          AutoSizeText(
                            'Agregar al Carrito',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
