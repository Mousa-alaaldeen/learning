// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  @override
  void dispose() {
    flutterTts.stop(); // إيقاف الصوت عند مغادرة الصفحة
    super.dispose();
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  Future<void> _showTranslation(String word) async {
    final translation = await translator.translate(word, from: 'en', to: 'ar');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Translation'),
          content: Text(translation.toString()),
          actions: [
            IconButton(
              onPressed: () {
                _speak(word);
              },
              icon: const Icon(Icons.volume_up),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String storyText =
        "Iron is very important in diet. It helps children grow and increase resistance to disease. It is particularly important for young women, pregnant women, and old people. We all need a lot of iron in our diet. A lack of iron makes people anaemic and causes fatigue and depression. Good sources of iron are liver, lentils, whole grains, green leafy vegetables, egg yolk, and molasses.";

    final words = storyText.split(' ');

    List<InlineSpan> spans = [];

    for (var word in words) {
      spans.add(
        TextSpan(
          text: '$word ',
          style: const TextStyle(
            fontSize: 18.0,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              _showTranslation(word);
            },
        ),
      );
    }
    Future speak(String text) async {
      await flutterTts.setVolume(1.0);
      await flutterTts.speak(text);
    }

    return Localizations.override(
      context: context,
      locale: const Locale('en'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text-to-Speech and Translation'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SelectableText.rich(
            TextSpan(children: spans),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            speak(storyText);
          },
          child: const Icon(Icons.volume_up),
        ),
      ),
    );
  }
}
