import 'package:bytebank/models/venda.dart';
import 'package:bytebank/screen/vendas/formulario_vendas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

const TituloAppbar = "Vendas";

class VendaRealizadas extends StatefulWidget {
  final List<venda> _listavenda = new List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaItemVendidos();
  }
}

class ListaItemVendidos extends State<VendaRealizadas> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(TituloAppbar),
      ),
      body: ListView.builder(
          itemCount: widget._listavenda.length,
          itemBuilder: (context, indice) {
            final itemlista = widget._listavenda[indice];
            return ItemVendido(itemlista);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return new FormularioVenda();
          })).then((VendaRecebida) => atualizaVenda(VendaRecebida));
        },
      ),
    );
  }

  void atualizaVenda(VendaRecebida) {
    if (VendaRecebida != null)
      setState(() {
        widget._listavenda.add(VendaRecebida);
      });
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
