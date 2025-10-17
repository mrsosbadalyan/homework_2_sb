import 'package:flutter/material.dart';

class Exercise2Page extends StatefulWidget {
  const Exercise2Page({super.key});

  @override
  State<Exercise2Page> createState() => _Exercise2PageState();
}

class _Exercise2PageState extends State<Exercise2Page> {
  final _s1 = TextEditingController(text: 'hello');
  final _s2 = TextEditingController(text: 'world');

  String concat = '';
  String substring = '';
  String upper = '';
  String lower = '';
  String title = '';

  @override
  void dispose() {
    _s1.dispose();
    _s2.dispose();
    super.dispose();
  }

  String _titleCase(String s) {
    return s
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .map((w) => w[0].toUpperCase() + w.substring(1).toLowerCase())
        .join(' ');
  }

  void _submit() {
    final a = _s1.text;
    final b = _s2.text;
    final c = '$a $b';
    final sub = a.isEmpty ? '' : a.substring(0, a.length.clamp(0, 3));
    setState(() {
      concat = c;
      substring = sub;
      upper = c.toUpperCase();
      lower = c.toLowerCase();
      title = _titleCase(c);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _s1,
            decoration: const InputDecoration(
              labelText: 'String 1',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _s2,
            decoration: const InputDecoration(
              labelText: 'String 2',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.play_arrow),
            label: const Text('SUBMIT'),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Concatenation: $concat'),
                  Text('Substring (first 0..3 of String 1): $substring'),
                  Text('Uppercase: $upper'),
                  Text('Lowercase: $lower'),
                  Text('Title Case: $title'),
                ],
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
