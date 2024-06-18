import 'package:exemplo_firebase/controller/todolist_controller.dart';
import 'package:exemplo_firebase/model/todolist.dart';
import 'package:exemplo_firebase/services/auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  final User user;
  const TodoListScreen({super.key, required this.user});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  AuthFirebase _auth = new AuthFirebase();

  final TodolistController _controller = TodolistController();

  final _tituloController = TextEditingController();

  Future<void> _getTodoList(String userId) async {
    try {
      await _controller.listar(userId);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _getTodoList(widget.user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                      future: _getTodoList(widget.user.uid),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (_controller.list.isEmpty) {
                          return Center(
                            child: Text(
                                "Você ainda não tem nenhuma tarefa cadastrada :("),
                          );
                        } else {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: _controller.list.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                      "${index} - ${_controller.list[index].titulo}"),
                                  subtitle: Text(
                                      '${_controller.list[index].timestamp}'),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _controller
                                          .delete(_controller.list[index].id);
                                      setState(() {});
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // showDialog
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Adicionar uma nova tarefa"),
                      content: TextField(
                        controller: _tituloController,
                      ),
                      actions: [
                        TextButton(
                          child: Text("Cancelar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text("Adicionar"),
                          onPressed: () {
                            Todolist newTask = Todolist(
                                id: "",
                                titulo: _tituloController.text,
                                userId: widget.user.uid,
                                timestamp: DateTime.now());
                            _controller.add(newTask);
                            Navigator.of(context).pop();
                            _tituloController.clear();
                            setState(() {});
                          },
                        ),
                      ],
                    );
                  });
            }));
  }
}
