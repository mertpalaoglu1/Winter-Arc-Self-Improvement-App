import 'package:flutter/material.dart';

class meditationPage extends StatefulWidget {
  const meditationPage({Key? key}) : super(key: key);

  @override
  State<meditationPage> createState() => _meditationPageState();
}

class _meditationPageState extends State<meditationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Meditation Page'),
      ],
    );
  }
}
