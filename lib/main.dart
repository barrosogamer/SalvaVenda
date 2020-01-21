import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: FormularioVenda(),
        ),
      ),
    );

class FormularioVenda extends StatelessWidget {
  final TextEditingController _controllervalor = TextEditingController();
  final TextEditingController _controllerproduto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionando Venda"),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controllervalor,
            dica: '0.00',
            rotulo: 'Valor Da Venda',
            teclado: TextInputType.number,
          ), //Editor
          Editor(
            dica: 'Nome',
            controlador: _controllerproduto,
            rotulo: 'Produto',
            icone: Icons.add_shopping_cart,
          ),
          RaisedButton(
              child: Text("Adicionar"), onPressed: () => criaFormulario()),
        ],
      ),
    );
  }

  void criaFormulario() {
    debugPrint("BotaoClicado");
    final double ValorVenda = double.tryParse(_controllervalor.text);
    final String NomeProduto = _controllerproduto.text;
    if (ValorVenda != null && NomeProduto != null) {
      final VendaFeita = venda(ValorVenda, NomeProduto);
      debugPrint("$VendaFeita");
    }
  }
}

class Editor extends StatelessWidget {
  final TextInputType teclado;
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.teclado, this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        keyboardType: teclado,
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
      ),
    );
  }
}

class VendaRealizadas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Vendas"),
      ),
      body: Column(
        children: <Widget>[
          ItemVendido(venda(30, "Jarra de Vidro 2 Litros")),
          ItemVendido(venda(100, "Kit de Panelas 5 peças")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemVendido extends StatelessWidget {
  final venda _venda;

  ItemVendido(this._venda);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.add_shopping_cart),
        title: Text(this._venda.valor.toString()),
        subtitle: Text(this._venda.produto),
      ),
    );
  }
}

class venda {
  final double valor;
  final String produto;

  venda(this.valor, this.produto);

  @override
  String toString() {
    // TODO: implement toString
    return "Venda{valor:$valor,produto:$produto}";
  }
}

//Text("Bem vindo ao flutter",textDirection: TextDirection.ltr,));
