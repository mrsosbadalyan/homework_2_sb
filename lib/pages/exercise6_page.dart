import 'package:flutter/material.dart';

class Exercise6Page extends StatefulWidget {
  const Exercise6Page({super.key});

  @override
  State<Exercise6Page> createState() => _Exercise6PageState();
}

class _Exercise6PageState extends State<Exercise6Page> {
  final _a = TextEditingController(text: '10');
  final _b = TextEditingController(text: '2');
  String result = '';

  String safeDivide(num a, num b) {
    if (b == 0) return 'Error: division by zero';
    final res = a / b;
    return res.toString();
  }

  void _run() {
    final na = num.tryParse(_a.text.trim());
    final nb = num.tryParse(_b.text.trim());
    if (na == null || nb == null) {
      setState(() => result = 'Invalid numbers');
      return;
    }
    setState(() => result = safeDivide(na, nb));
  }

  @override
  void dispose() {
    _a.dispose();
    _b.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 6')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _a,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Number A',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _b,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Number B',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(onPressed: _run, child: const Text('DIVIDE')),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.calculate),
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
