import 'package:flutter/material.dart';
import 'package:app_lista1/tarefa_controller.dart';
import 'package:provider/provider.dart';

class ListaTarefasScreen extends StatelessWidget {
  // Controlador para o campo de texto de nova tarefa
  final TextEditingController _controller = TextEditingController();
  //static const IconData clear = IconData(0xe168, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nova Tarefa',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarTarefa do Provider para atualizar o estado
                    Provider.of<ListaTarefasController>(context, listen: false)
                        .adicionarTarefa(_controller.text);
                    // Limpar o campo de texto após adicionar a tarefa
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaTarefasController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.tarefas[index].descricao),
                      leading: IconButton(
                          onPressed: () {
                            model.excluirTarefa(index);
                          },
                          icon: Icon(Icons.clear)),
                      trailing: Checkbox(
                        value: model.tarefas[index].concluida,
                        onChanged: (value) {
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          model.marcarComoConcluida(index);
                        },
                      ),
                      onLongPress: () {
                        // Chamando o método excluirTarefa do Provider para atualizar o estado
                        model.excluirTarefa(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
