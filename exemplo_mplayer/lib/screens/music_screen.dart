import 'package:exemplo_mplayer/services/music_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MusicService _service = MusicService();

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
                if (_service.listMusic.isEmpty) {
                  return CircularProgressIndicator();
                  //return Text("Carregando...");
                } else {
                  // ListViewBuilder
                  return ListView.builder(
                    itemCount: _service.listMusic.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_service.listMusic[index].title),
                        subtitle: Text(_service.listMusic[index].artist),
                      );
                    },
                  );
                }
              }),
        ),
      ),
    );
  }

  Future<void> _buscarMusicas() async {
    try {
      await _service.fetchMusic();
      setState(() {});
    } catch (e) {
    print(e.toString());
  }
}
