import 'package:flutter/material.dart';

class Exercise10Page extends StatefulWidget {
  const Exercise10Page({super.key});

  @override
  State<Exercise10Page> createState() => _Exercise10PageState();
}

class _Exercise10PageState extends State<Exercise10Page> {
  final _listCtrl = TextEditingController(text: '1,2,3,4,5,6,10,11');
  List<int> source = [];
  List<int> evens = [];
  String? error;

  void _filter() {
    setState(() {
      error = null;
      try {
        final parts = _listCtrl.text
            .split(',')
            .map((s) => s.trim())
            .where((s) => s.isNotEmpty);
        final nums = <int>[];
        for (final p in parts) {
          final n = int.tryParse(p);
          if (n == null) throw FormatException('Invalid integer: "$p"');
          nums.add(n);
        }
        source = nums;
        evens = nums.where((x) => x.isEven).toList();
      } catch (e) {
        error = e.toString();
        source = [];
        evens = [];
      }
    });
  }

  @override
  void dispose() {
    _listCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 10')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Enter a list of integers (comma-separated)'),
          TextField(
            controller: _listCtrl,
            decoration: const InputDecoration(
              hintText: 'e.g., 1,2,3,4,5,6,10,11',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(onPressed: _filter, child: const Text('FILTER EVENS')),
          const SizedBox(height: 12),
          if (error != null)
            Card(
              color: Theme.of(context).colorScheme.errorContainer,
              child: ListTile(
                leading: const Icon(Icons.error_outline),
                title: Text(
                  error!,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer),
                ),
              ),
            )
          else
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Source: $source'),
                    Text('Evens : $evens'),
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
