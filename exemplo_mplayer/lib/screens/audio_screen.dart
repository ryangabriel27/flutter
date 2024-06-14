import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo_mplayer/model/music_model.dart';
import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  final MusicModel music;
  AudioScreen({required this.music});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late AudioPlayer _player;

  bool _isPlaying = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    _player.play(UrlSource(widget.music.url));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _player.dispose();
    super.dispose();
  }

  void _playPause() {
    if (_isPlaying) {
      _player.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      _player.play(UrlSource(widget.music.url));
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  _playPause();
                },
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow))
          ],
        ),
      ),
    );
  }
}
