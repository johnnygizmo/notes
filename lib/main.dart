import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/providers/scaleprovider.dart';
import 'package:notes/screens/chord_speller.dart';
import 'package:notes/screens/interval_speller.dart';
import 'package:notes/screens/scale_speller.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(home: MainApp()),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Notes'),
        backgroundColor: Colors.grey[300],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      ref.read(scaleProvider.notifier).reset(GuessType.scale);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScaleSpeller()));
                    },
                    child: const Text("Major Scales")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      ref.read(scaleProvider.notifier).reset(GuessType.chord);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChordSpeller()));
                    },
                    child: const Text("Major Chords")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(scaleProvider.notifier)
                          .reset(GuessType.interval);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IntervalSpeller()));
                    },
                    child: const Text("Intervals")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
