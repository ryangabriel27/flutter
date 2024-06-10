import 'package:exemplo_firebase/controller/todolist_controller.dart';
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
            ListTile(
              title: Text("Adicionar uma nova tarefa"),
              leading: Icon(Icons.add),
              onTap: () {},
            ),
            Expanded(
                child: FutureBuilder(
                    future: _controller.listar(widget.user.uid),
                    builder: (context, snapshot) {
                      if (_controller.list.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: _controller.list.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_controller.list[index].titulo),
                              subtitle:
                                  Text('${_controller.list[index].timestamp}'),
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
                        );
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
