import 'package:flutter/material.dart';

class Person {
  final String name;
  final int age;
  const Person({required this.name, required this.age});
}

class AdvancedPerson extends Person {
  const AdvancedPerson({required super.name, required super.age});

  String lifeStage() {
    if (age < 0) return 'Unknown';
    if (age < 13) return 'Child';
    if (age <= 19) return 'Teenager';
    if (age < 65) return 'Adult';
    return 'Senior';
  }
}

class Exercise9Page extends StatefulWidget {
  const Exercise9Page({super.key});

  @override
  State<Exercise9Page> createState() => _Exercise9PageState();
}

class _Exercise9PageState extends State<Exercise9Page> {
  final _name = TextEditingController(text: 'Bob');
  final _age = TextEditingController(text: '15');
  String result = '';

  void _check() {
    final n = _name.text.trim();
    final a = int.tryParse(_age.text.trim());
    if (n.isEmpty || a == null) {
      setState(() => result = 'Invalid input');
      return;
    }
    final p = AdvancedPerson(name: n, age: a);
    setState(() => result = '${p.name} is a "${p.lifeStage()}"');
  }

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 9')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _name,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _age,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Age',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(onPressed: _check, child: const Text('CHECK LIFE STAGE')),
          const SizedBox(height: 12),
          Card(child: ListTile(title: Text(result))),
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
