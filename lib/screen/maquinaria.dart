import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MaquinariaScreen extends StatefulWidget {
  const MaquinariaScreen({Key? key}) : super(key: key);

  @override
  State<MaquinariaScreen> createState() => _MaquinariaScreenState();
}

class _MaquinariaScreenState extends State<MaquinariaScreen> {
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
      ),
      body: AutoSizeText('$MaquinariaScreen'),
    );
  }
}
