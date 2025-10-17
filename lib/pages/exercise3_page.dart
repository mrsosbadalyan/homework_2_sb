import 'package:flutter/material.dart';

class Exercise3Page extends StatefulWidget {
  const Exercise3Page({super.key});

  @override
  State<Exercise3Page> createState() => _Exercise3PageState();
}

class _Exercise3PageState extends State<Exercise3Page> {
  final _jsonCtrl = TextEditingController(text: '{"Armenia":"Yerevan","France":"Paris","Japan":"Tokyo"}');
  List<String> lines = [];

  void _iterate() {
    try {
      final raw = _jsonCtrl.text.trim();
      final map = <String, String>{};
      final body = raw.replaceAll(RegExp(r'^\s*{\s*|\s*}\s*$'), '');
      if (body.isNotEmpty) {
        for (final pair in body.split(',')) {
          final kv = pair.split(':');
          if (kv.length == 2) {
            final k = kv[0].trim().replaceAll('"', '');
            final v = kv[1].trim().replaceAll('"', '');
            map[k] = v;
          }
        }
      }
      setState(() => lines = map.entries.map((e) => '${e.key} -> ${e.value}').toList());
    } catch (_) {
      setState(() => lines = ['Invalid simple map format.']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 3')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Enter a simple map like {"A":"1","B":"2"}'),
          TextField(
            controller: _jsonCtrl,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: _iterate,
            child: const Text('ITERATE'),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: lines.map((e) => Text(e)).toList(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName('/')),
            icon: const Icon(Icons.home),
            label: const Text('Back to EXERCISES'),
          ),
        ],
      ),
    );
  }
}
