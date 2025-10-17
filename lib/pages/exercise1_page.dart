import 'package:flutter/material.dart';

class Exercise1Page extends StatefulWidget {
  const Exercise1Page({super.key});

  @override
  State<Exercise1Page> createState() => _Exercise1PageState();
}

class _Exercise1PageState extends State<Exercise1Page> {
  final _titlesCtrl = TextEditingController(text: '"Taxi 1","Taxi 2","Taxi 3"');
  final _yearsCtrl = TextEditingController(text: '1998,2000,2003');

  List<String> _pairs = [];
  String? _error;

  @override
  void dispose() {
    _titlesCtrl.dispose();
    _yearsCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      _error = null;
      _pairs = [];
      try {
        final titles = _parseQuotedCSV(_titlesCtrl.text);
        if (titles.length != 3) {
          throw FormatException('Please enter exactly 3 titles like "A","B","C".');
        }
        final years = _parseYears(_yearsCtrl.text);
        if (years.length != 3) {
          throw FormatException('Please enter exactly 3 years like 1998,2000,2003.');
        }
        for (int i = 0; i < 3; i++) {
          _pairs.add('${titles[i]} — ${years[i]}');
        }
      } catch (e) {
        _error = e.toString();
      }
    });
  }

  List<String> _parseQuotedCSV(String input) {
    final pattern = RegExp(r'"([^"]*)"');
    final matches = pattern.allMatches(input);
    final result = [for (final m in matches) m.group(1)!.trim()].where((s) => s.isNotEmpty).toList();
    return result;
  }

  List<int> _parseYears(String input) {
    final parts = input.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty);
    final years = <int>[];
    for (final p in parts) {
      final y = int.tryParse(p);
      if (y == null || y < 1888 || y > 2025) {
        throw FormatException('Invalid year "$p". Use 4 digits between 1888 and 2025.');
      }
      years.add(y);
    }
    return years;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Enter 3 movie titles (quoted, comma-separated)'),
          TextField(
            controller: _titlesCtrl,
            decoration: const InputDecoration(
              hintText: '"Taxi 1","Taxi 2","Taxi 3"',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          const Text('Enter 3 release years (comma-separated, 1888–2025)'),
          TextField(
            controller: _yearsCtrl,
            decoration: const InputDecoration(
              hintText: '1998,2000,2003',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.check),
            label: const Text('SUBMIT'),
          ),
          const SizedBox(height: 12),
          if (_error != null)
            Card(
              color: Theme.of(context).colorScheme.errorContainer,
              child: ListTile(
                leading: const Icon(Icons.error_outline),
                title: Text(
                  _error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
                ),
              ),
            )
          else
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: _pairs.isEmpty
                    ? const Text('Result will appear here.')
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _pairs.map((e) => Text(e)).toList(),
                ),
              ),
            ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
            icon: const Icon(Icons.home),
            label: const Text('Back to EXERCISES'),
          ),
        ],
      ),
    );
  }
}
