import 'package:bytebank/screen/vendas/Lista_de_vendas.dart';
import 'package:flutter/material.dart';

void main() => runApp(SalvaVendas());
class SalvaVendas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyan[900],
        accentColor: Colors.blueGrey[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueGrey[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: VendaRealizadas(),
    );
  }
}
