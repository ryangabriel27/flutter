import 'package:app_animais/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaAnimais extends StatelessWidget {
  // Controlador para o campo de texto de nova tarefa
  final TextEditingController _controller = TextEditingController();
  //static const IconData clear = IconData(0xe168, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Animais'),
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
                labelText: 'Novo animal',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    showD
                    // Chamando o método adicionarTarefa do Provider para atualizar o estado
                    Provider.of<AnimalController>(context, listen: false)
                        .adicionarAnimal(_controller.text);
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
            child: Consumer<AnimalController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.listarAnimais.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.listarAnimais[index].descricao),
                      leading: IconButton(
                          onPressed: () {
                            model.excluirAnimal(index);
                          },
                          icon: Icon(Icons.clear)),
                          //onTap: ,
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

class AnimaisTelaDetalhe {}
