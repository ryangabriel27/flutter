import 'package:app_lista1/tarefa_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista1/tarefa_controller.dart';

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: ChangeNotifierProvider(
        create: (context) => ListaTarefasController(),
        child: ListaTarefasScreen(),
      ),
    );
  }
}
