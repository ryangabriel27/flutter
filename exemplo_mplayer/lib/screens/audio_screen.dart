import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo_mplayer/model/audio_model.dart';
import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  final AudioModel audio;
  const AudioScreen({super.key, required this.audio});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  bool _isPlaying = true;
  late AudioPlayer _player;
  Duration _currentPosition = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    _player.play(UrlSource(widget.audio.url));
    _player.onPositionChanged.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });
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
      _player.play(UrlSource(widget.audio.url));
      setState(() {
        _isPlaying = true;
      });
    }
  }

  void _avancar10() {
    final newPosition = _currentPosition + const Duration(seconds: 10);
    _player.seek(newPosition);
  }

  void _voltar10() {
    final newPosition = _currentPosition - const Duration(seconds: 10);
    _player.seek(newPosition);
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
          title: Text(
            widget.audio.title,
            style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(_isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_fill),
                iconSize: 60,
                onPressed: () {
                  _playPause();
                },
              ),
              Text(_isPlaying ? 'Reproduzindo' : 'Pausado',
                  style: const TextStyle(
                    fontSize: 20,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.replay_10),
                    iconSize: 40,
                    onPressed: _voltar10,
                  ),
                  IconButton(
                    icon: const Icon(Icons.forward_10),
                    iconSize: 40,
                    onPressed: _avancar10,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
