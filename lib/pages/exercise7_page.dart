import 'package:flutter/material.dart';

class Exercise7Page extends StatefulWidget {
  const Exercise7Page({super.key});

  @override
  State<Exercise7Page> createState() => _Exercise7PageState();
}

class _Exercise7PageState extends State<Exercise7Page> {
  String nowStr = '';

  String _formatNow() {
    final now = DateTime.now();
    String pad2(int x) => x.toString().padLeft(2, '0');
    return '${now.year}-${pad2(now.month)}-${pad2(now.day)} '
        '${pad2(now.hour)}:${pad2(now.minute)}:${pad2(now.second)}';
  }

  @override
  void initState() {
    super.initState();
    nowStr = _formatNow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 7')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.access_time),
                title: Text(nowStr),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => setState(() => nowStr = _formatNow()),
              child: const Text('REFRESH'),
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
      ),
    );
  }
}
