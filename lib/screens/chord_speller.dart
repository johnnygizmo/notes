import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/providers/scaleprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChordSpeller extends ConsumerStatefulWidget {
  const ChordSpeller({super.key});

  @override
  ConsumerState<ChordSpeller> createState() => _ChordSpellerState();
}

class _ChordSpellerState extends ConsumerState<ChordSpeller> {
  var node = FocusNode();
  @override
  Widget build(BuildContext context) {
    var sp = ref.watch(scaleProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chord Speller'),
        backgroundColor: Colors.grey[300],
      ),
      body: KeyboardListener(
        autofocus: true,
        focusNode: node,
        onKeyEvent: (value) {
          if (value.logicalKey == LogicalKeyboardKey.space) {
            ref.read(scaleProvider.notifier).nextChord();
          }
          String? guess = eventToGuess(value);
          if (guess != null) {
            ref.read(scaleProvider.notifier).guess(guess, ref);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'Spell Chord: ${sp.chord?.root} ${sp.chord?.pattern.abbreviation}',
                  style: const TextStyle(fontSize: 26)),
              Text(sp.message, style: const TextStyle(fontSize: 24)),
              sp.guesses.isEmpty
                  ? const Text("Entries: [ ]")
                  : Text("Entries: ${sp.guesses}"),
              sp.guess >= sp.chord!.items.length
                  ? ElevatedButton(
                      onPressed: () {
                        ref.read(scaleProvider.notifier).nextChord();
                      },
                      child: const Text("Next Chord"))
                  : const ChromaticWidget(),
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).nextChord();
                  },
                  child: const Text('Skip')),
            ],
          ),
        ),
      ),
    );
  }
}
