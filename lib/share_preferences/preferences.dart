import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static List<String> _carrito = [];

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> get carrito {
    return _prefs.getStringList('carrito') ?? _carrito;
  }

  static set carrito(List<String> carrito) {
    _carrito = [];
    _carrito.addAll(carrito);
    _prefs.setStringList('carrito', _carrito);
  }
}
