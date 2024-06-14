import 'package:exemplo_mplayer/controllers/music_controller.dart';
import 'package:exemplo_mplayer/screens/audio_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MusicController _controller = MusicController();

  // initState
  @override
  void initState() {
    super.initState();
    _buscarMusicas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
      ),
      body: // FutureBuilder, listando todas as musicas disponiveis
          Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: FutureBuilder(
              future: _buscarMusicas(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (_controller.list.isEmpty) {
                  return Center(child: Text("Nenhuma música disponível"));
                } else {
                  // Listbuilder
                  return Expanded(
                    child: ListView.builder(
                        itemCount: _controller.list.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(_controller.list[index].title),
                              subtitle: Text(_controller.list[index].artist),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AudioScreen(
                                          music: _controller.list[index]
                                        )));
                              });
                        }),
                  );
                }
              }),
        ),
      ),
    );
  }

  Future<void> _buscarMusicas() async {
    try {
      await _controller.fetchFromFirestore();
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }
}
