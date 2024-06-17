import 'package:exemplo_mplayer/controllers/audio_controller.dart';
import 'package:flutter/material.dart';

import 'audio_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = AudioController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TigerMusic",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder(
          future: _getList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (_controller.list.isEmpty) {
              return const Center(
                child: Text("Não há audios cadastrados"),
              );
            } else {
              return ListView.builder(
                itemCount: _controller.list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.album),
                    title: Text(_controller.list[index].title),
                    subtitle: Text(
                        "${_controller.list[index].artist} - ${_controller.list[index].duration}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AudioScreen(
                                  audio: _controller.list[index],
                                )),
                      );
                    },
                  );
                },
              );
            }
          }),
    );
  }

  Future<void> _getList() async {
    try {
      _controller.fetchFromFireStore();
    } catch (e) {
      print(e.toString());
    }
  }
}
