import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:venta_mostrador_touch/model/carrito.dart';
import 'package:venta_mostrador_touch/share_preferences/preferences.dart';

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({Key? key}) : super(key: key);

  @override
  State<CarritoScreen> createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  CarritoModel _carrito = CarritoModel();
  List<String> _carritoList = [];
  double _subTotal = 0;
  double _impuestos = 0;
  double _total = 0;

  @override
  void initState() {
    setState(() {
      _carritoList = Preferences.carrito;

      for (String carrito in _carritoList) {
        _carrito = CarritoModel.fromRawJson(carrito);
        _subTotal += _carrito.valorTotal!;
      }

      _impuestos = _subTotal * 0.12;
      _total = _impuestos + _subTotal;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightDetails = (size.height * 0.78);

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              width: size.width,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      AutoSizeText(
                        'SubTotal:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      AutoSizeText(
                        'Impuestos:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      AutoSizeText(
                        'Total:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      AutoSizeText(
                        '$_subTotal',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      AutoSizeText(
                        '$_impuestos',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      AutoSizeText(
                        '$_total',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width,
              height: heightDetails,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const AutoSizeText(
                            'Continuar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            tooltip: 'Proceder con el pedido',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: _carritoList.length,
                      itemBuilder: (BuildContext otherContext, int index) {
                        var newWidth =
                            (MediaQuery.of(otherContext).size.width * 0.19)
                                .roundToDouble();
                        _carrito =
                            CarritoModel.fromRawJson(_carritoList[index]);
                        return Row(
                          key: ObjectKey(_carrito.id),
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: newWidth,
                              child: Image.network(
                                  'https://dummyimage.com/400x250/000/fff'),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: newWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AutoSizeText(
                                    _carrito.id!.substring(0, 8),
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                  ),
                                  AutoSizeText(
                                    _carrito.id!.substring(0, 13),
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: newWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          fixedSize: const Size(20, 20),
                                          shape: const CircleBorder(),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _carrito = CarritoModel.fromRawJson(
                                                _carritoList[index]);
                                            _carrito.cantidad =
                                                _carrito.cantidad! + 1;
                                            _carrito.valorTotal =
                                                _carrito.cantidad! *
                                                    _carrito.valorUnitario!;
                                            var newValue = _carrito.toRawJson();
                                            _carritoList[index] = newValue;
                                            Preferences.carrito = _carritoList;
                                            _subTotal = 0;
                                            for (String carrito
                                                in _carritoList) {
                                              _carrito =
                                                  CarritoModel.fromRawJson(
                                                      carrito);
                                              _subTotal += _carrito.valorTotal!;
                                            }

                                            _impuestos = _subTotal * 0.12;
                                            _total = _impuestos + _subTotal;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                      AutoSizeText('${_carrito.cantidad}'),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          fixedSize: const Size(20, 20),
                                          shape: const CircleBorder(),
                                        ),
                                        onPressed: _carrito.cantidad! > 1
                                            ? () {
                                                setState(() {
                                                  _carrito =
                                                      CarritoModel.fromRawJson(
                                                          _carritoList[index]);
                                                  _carrito.cantidad =
                                                      _carrito.cantidad! - 1;
                                                  _carrito.valorTotal = _carrito
                                                          .cantidad! *
                                                      _carrito.valorUnitario!;
                                                  var newValue =
                                                      _carrito.toRawJson();
                                                  _carritoList[index] =
                                                      newValue;
                                                  Preferences.carrito =
                                                      _carritoList;
                                                  _subTotal = 0;
                                                  for (String carrito
                                                      in _carritoList) {
                                                    _carrito = CarritoModel
                                                        .fromRawJson(carrito);
                                                    _subTotal +=
                                                        _carrito.valorTotal!;
                                                  }

                                                  _impuestos = _subTotal * 0.12;
                                                  _total =
                                                      _impuestos + _subTotal;
                                                });
                                              }
                                            : null,
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  AutoSizeText('${_carrito.valorUnitario}'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: newWidth,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                hoverColor: Colors.black12,
                                onPressed: () {
                                  setState(() {
                                    Dialogs.materialDialog(
                                      color: Colors.white,
                                      msg:
                                          'Desea eliminar el producto seleccionado',
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
                                            'Cancelar',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _carritoList.removeAt(index);
                                              Preferences.carrito =
                                                  _carritoList;
                                              _subTotal = 0;
                                              for (String carrito
                                                  in _carritoList) {
                                                _carrito =
                                                    CarritoModel.fromRawJson(
                                                        carrito);
                                                _subTotal +=
                                                    _carrito.valorTotal!;
                                              }

                                              _impuestos = _subTotal * 0.12;
                                              _total = _impuestos + _subTotal;
                                            });

                                            if (_carritoList.isEmpty) {
                                              _impuestos = 0;
                                              _subTotal = 0;
                                              _total = 0;
                                              Modular.to.navigate('/partes');
                                            }

                                            Modular.to.pop();
                                          },
                                          child: const AutoSizeText(
                                            'Ok',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                                },
                                tooltip: 'Eliminar producto del carrito',
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
