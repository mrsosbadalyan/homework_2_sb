import 'package:flutter/material.dart';

class Exercise4Page extends StatefulWidget {
  const Exercise4Page({super.key});

  @override
  State<Exercise4Page> createState() => _Exercise4PageState();
}

class _Exercise4PageState extends State<Exercise4Page> {
  final _numCtrl = TextEditingController(text: '0');
  String result = '';

  String classify(int n) {
    if (n > 0) return 'positive';
    if (n < 0) return 'negative';
    return 'zero';
  }

  void _run() {
    final n = int.tryParse(_numCtrl.text.trim());
    setState(() => result = n == null ? 'Invalid integer' : classify(n));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 4')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _numCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter integer',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(onPressed: _run, child: const Text('CHECK')),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text('Result: $result'),
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
