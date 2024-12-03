import 'package:flutter/material.dart';
import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/providers/scaleprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Map<String, String> intervals = {
  'P1': 'Unison',
  'm2': 'Minor 2nd',
  'M2': 'Major 2nd',
  'm3': 'Minor 3rd',
  'M3': 'Major 3rd',
  'P4': 'Perfect 4th',
  'A4': 'Augmented 4th',
  'D5': 'Diminsiehd 5th',
  'P5': 'Perfect 5th',
  'm6': 'Minor 6th',
  'M6': 'Major 6th',
  'm7': 'Minor 7th',
  'M7': 'Major 7th',
  'P8': 'Octave'
};

class IntervalSpeller extends ConsumerWidget {
  const IntervalSpeller({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sp = ref.watch(scaleProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interval Speller'),
        backgroundColor: Colors.grey[300],
      ),
      body: Center(
        child: Column(
          children: [
            Text('${intervals[sp.interval.toString()]} from ${sp.startNote}',
                style: const TextStyle(fontSize: 26)),
            ElevatedButton(
                onPressed: () {
                  ref.read(scaleProvider.notifier).nextInterval();
                },
                child: const Text('Skip')),
            Text(sp.message, style: const TextStyle(fontSize: 24)),
            Text(sp.guesses.toString(), style: const TextStyle(fontSize: 22)),
            sp.guess >= 1
                ? ElevatedButton(
                    onPressed: () {
                      ref.read(scaleProvider.notifier).nextInterval();
                    },
                    child: const Text("Next Interval"))
                : const ChromaticWidget()
          ],
        ),
      ),
    );
  }
}
