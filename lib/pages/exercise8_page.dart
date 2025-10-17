import 'package:flutter/material.dart';

class Person {
  final String name;
  final int age;
  const Person({required this.name, required this.age});
}

class Exercise8Page extends StatefulWidget {
  const Exercise8Page({super.key});

  @override
  State<Exercise8Page> createState() => _Exercise8PageState();
}

class _Exercise8PageState extends State<Exercise8Page> {
  final _name = TextEditingController(text: 'Alice');
  final _age = TextEditingController(text: '21');
  Person? person;

  void _create() {
    final n = _name.text.trim();
    final a = int.tryParse(_age.text.trim());
    if (n.isEmpty || a == null) {
      setState(() => person = null);
      return;
    }
    setState(() => person = Person(name: n, age: a));
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
      appBar: AppBar(title: const Text('Exercise 8')),
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
          FilledButton(onPressed: _create, child: const Text('CREATE PERSON')),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(person == null
                  ? 'No person yet'
                  : 'Name: ${person!.name}, Age: ${person!.age}'),
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
