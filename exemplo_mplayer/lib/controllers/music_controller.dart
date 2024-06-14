import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemplo_mplayer/model/music_model.dart';
import 'package:firebase_core/firebase_core.dart';

class MusicController {
  List<MusicModel> _list = [];
  List<MusicModel> get list => _list;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // FetchFromFirestore
  Future<void> fetchFromFirestore() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('audio').get();
      List<dynamic> result = querySnapshot.docs as List;
      _list = result.map((doc) => MusicModel.fromJson(doc.data())).toList();
    } catch (e) {
      print(e);
    }
  }
}
