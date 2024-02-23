import 'package:app_lista_compra/compras_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_compra/compras_controller.dart';

class ListaComprasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: ChangeNotifierProvider(
        create: (context) => ListaComprasController(),
        child: ListaComprasScreen(),
      ),
    );
  }
}
