import 'package:bytebank/components/Editor.dart';
import 'package:bytebank/models/venda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 const rotulocampovenda ='Valor Da Venda';
 const dicacampovenda ='0.00';
 const rotulocampoproduto ='Produto';
 const dicacampoproduto ='Nome';
 const TituloAppBar ="Adicionando Venda";

class FormularioVenda extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioVendaState();
  }
}

class FormularioVendaState extends State<FormularioVenda> {
  final TextEditingController _controllervalor = TextEditingController();
  final TextEditingController _controllerproduto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controllervalor,
              dica: dicacampovenda,
              rotulo: rotulocampovenda,
              teclado: TextInputType.number,
            ), //Editor
            Editor(
              dica:dicacampoproduto,
              controlador: _controllerproduto,
              rotulo: rotulocampoproduto,
              icone: Icons.add_shopping_cart,
            ),
            RaisedButton(
                child: Text("Adicionar"),
                onPressed: () => criaFormulario(context)),
          ],
        ),
      ),
    );
  }

  void criaFormulario(BuildContext context) {
    debugPrint("BotaoClicado");
    final double ValorVenda = double.tryParse(_controllervalor.text);
    final String NomeProduto = _controllerproduto.text;
    if (ValorVenda != null && NomeProduto != null) {
      final VendaFeita = venda(ValorVenda, NomeProduto);
      Navigator.pop(context, VendaFeita);
    }
  }
}
