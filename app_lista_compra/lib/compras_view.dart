import 'package:flutter/material.dart';
import 'package:app_lista_compra/compras_controller.dart';
import 'package:provider/provider.dart';

class ListaComprasScreen extends StatelessWidget {
  // Controlador para o campo de texto de nova tarefa
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de compras'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 49, 49, 49),
        foregroundColor: Colors.white,
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
                labelText: 'Adicione um novo item',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    if (_controller.text.trim().isEmpty) {
                      // Mostra um alerta, caso tente adicionar uma compra vazia
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Erro!'),
                          content: Text(
                              'Não é possível adicionar uma compra vazia.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Fecha o AlertDialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Chamando o método adicionarTarefa do Provider para atualizar o estado
                      Provider.of<ListaComprasController>(context,
                              listen: false)
                          .adicionarCompra(_controller.text);
                      // Limpar o campo de texto após adicionar a tarefa
                      showDialog(
                        // Notifica o usuario
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Concluido'),
                          content: Text('Item adicionado!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Fecha o AlertDialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                      _controller.clear(); // Limpa o campo
                    }
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ),
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaComprasController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.compras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text((index + 1).toString() +
                          " - " +
                          model.compras[index].nomeDoProduto),
                      trailing: IconButton(
                          onPressed: () {
                            model.excluirCompra(index);
                            showDialog(
                              // Notifica o usuario
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Concluido'),
                                content: Text('Item excluído!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Fecha o AlertDialog
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Icon(Icons.delete, color: Colors.red,)),
                      leading: Checkbox(
                        value: model.compras[index].comprada,
                        onChanged: (value) {
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          model.marcarComoConcluida(index);
                          if (model.compras[index].comprada) { //Verifica se a tarefa ja foi concluida
                            showDialog(
                              // Notifica o usuario
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Concluido'),
                                content: Text('Item comprado!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Fecha o AlertDialog
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                      onLongPress: () {
                        // Chamando o método excluirTarefa do Provider para atualizar o estado
                        showDialog(
                          // Notifica o usuario
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Concluido'),
                            content: Text('Item excluído!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Fecha o AlertDialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                        model.excluirCompra(index);
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
