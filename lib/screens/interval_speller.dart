import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/providers/settings_provider.dart';
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

class IntervalSpeller extends ConsumerStatefulWidget {
  const IntervalSpeller({super.key});

  @override
  ConsumerState<IntervalSpeller> createState() => _IntervalSpellerState();
}

class _IntervalSpellerState extends ConsumerState<IntervalSpeller> {
  var node = FocusNode();

  @override
  Widget build(BuildContext context) {
    var sp = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interval Speller'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: KeyboardListener(
          autofocus: true,
          focusNode: node,
          onKeyEvent: (value) {
            if (value.logicalKey == LogicalKeyboardKey.space) {
              ref.read(settingsProvider.notifier).nextInterval();
            }
            String? guess = eventToGuess(value);
            if (guess != null) {
              ref.read(settingsProvider.notifier).guess(guess, ref);
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(
                    'Interval: ${intervals[sp.interval.toString()]} up from ${sp.startNote}',
                    style: const TextStyle(fontSize: 26)),

                Text(sp.message, style: const TextStyle(fontSize: 24)),

                sp.guesses.isEmpty
                    ? const Text("Entries: [ ]")
                    : Text("Entries: ${sp.guesses}"),
                const SizedBox(
                  height: 25,
                ),
                //  Text(sp.guesses.toString(), style: const TextStyle(fontSize: 22)),
                sp.guess >= 1
                    ? ElevatedButton(
                        onPressed: () {
                          ref.read(settingsProvider.notifier).nextInterval();
                        },
                        child: const Text("Next Interval"))
                    : const ChromaticWidget(),
                const SizedBox(
                  height: 25,
                ),
                Text("Errors: ${sp.errors}"),
                ElevatedButton(
                    onPressed: () {
                      ref.read(settingsProvider.notifier).nextInterval();
                    },
                    child: const Text('Skip')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
