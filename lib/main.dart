import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'just_audio_windows_repro',
      home: MyHomePage(title: 'just_audio_windows_repro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player.setUrl(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3');
  }

  void play() {
    player.play();
  }

  void pause() {
    player.pause();
  }

  Future<void> pitch(double pitch) async {
    await player.setPitch(pitch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: play, child: const Text('Play')),
                ElevatedButton(onPressed: pause, child: const Text('Pause')),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    pitch(-1.0);
                  },
                  child: const Text('Pitch -1.0'),
                ),
                ElevatedButton(
                  onPressed: () {
                    pitch(0);
                  },
                  child: const Text('Pitch 0'),
                ),
                ElevatedButton(
                  onPressed: () {
                    pitch(1.0);
                  },
                  child: const Text('Pitch 1.0'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
