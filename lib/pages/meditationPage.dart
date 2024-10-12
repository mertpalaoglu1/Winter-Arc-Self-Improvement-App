import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class meditationPage extends StatefulWidget {
  const meditationPage({Key? key}) : super(key: key);

  @override
  State<meditationPage> createState() => _meditationPageState();
}

class _meditationPageState extends State<meditationPage> {
  late AudioPlayer player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    player = AudioPlayer(); //created an audio instance
    player.setReleaseMode(ReleaseMode.stop);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(AssetSource('')); //asset eklenecek.
    });
  }

  void dispose() {
    // iş bittikten sonra player dispose edilir.
    player.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Meditation Page'),
      ],
    );
  }
}
