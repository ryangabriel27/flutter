import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemplo_firebase/model/todolist.dart';

class TodolistController {
  List<Todolist> _list = [];
  List<Todolist> get list => _list;

  // Classe firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Métodos
  // Adicionar
  Future<void> add(Todolist todo) async {
    final docRef = await _firestore.collection('todolist').add(todo.toMap());
  }

  // Delete
  Future<void> delete(String id) async {
    await _firestore.collection('todolist').doc(id).delete();
  }

  // Listar
  Future<List<Todolist>> listar(String userId) async {
    //  Querysnapshot
    QuerySnapshot querySnapshot = await _firestore
        .collection('todolist')
        .where('userId', isEqualTo: userId)
        .get();
    List<dynamic> result = querySnapshot.docs as List;

    _list = result.map((doc) => Todolist.fromJson(doc.data(), doc.id)).toList();
    return _list;
  }
}
