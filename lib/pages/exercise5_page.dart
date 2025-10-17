import 'package:flutter/material.dart';

class Exercise5Page extends StatefulWidget {
  const Exercise5Page({super.key});

  @override
  State<Exercise5Page> createState() => _Exercise5PageState();
}

class _Exercise5PageState extends State<Exercise5Page> {
  final _nameCtrl = TextEditingController(text: 'Anna');
  final _ageCtrl = TextEditingController(text: '22');

  String greeting = '';

  void _greet() {
    final name = _nameCtrl.text.trim();
    final age = int.tryParse(_ageCtrl.text.trim());
    if (name.isEmpty || age == null) {
      setState(() => greeting = 'Invalid input. Hi there!');
      return;
    }
    final msg = age < 18 ? 'You are not an adult yet. You are a tenn' : 'You are an adult.';
    setState(() => greeting = 'Hello, $name! $msg');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 5')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _nameCtrl,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _ageCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Age',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(onPressed: _greet, child: const Text('GREET')),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(greeting),
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
