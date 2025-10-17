import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (i) => i + 1);
    return Scaffold(
      appBar: AppBar(title: const Text('EXERCISES')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            for (final n in items)
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/ex$n'),
                child: Text('Exercise $n'),
              ),
          ],
        ),
      ),
    );
  }
}
