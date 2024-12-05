import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_notes/music_notes.dart';

import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/providers/settings_provider.dart';
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
    var sp = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chord Speller'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        
        child: KeyboardListener(
          autofocus: true,
          focusNode: node,
          onKeyEvent: (value) {
            if (value.logicalKey == LogicalKeyboardKey.space) {
              ref.read(settingsProvider.notifier).nextChord();
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
                SegmentedButton<ChordPattern>(
                    multiSelectionEnabled: true,
                    onSelectionChanged: (p0) {
                      ref.read(settingsProvider.notifier).state =
                          sp.copyWith(selectedChords: p0);
                    },
                    segments: (chordOptions
                        .map(((ChordPattern, String) chord) =>
                            ButtonSegment<ChordPattern>(
                                value: chord.$1,
                                label: Text(
                                  softWrap: true,
                                  maxLines: 3,
                                  chord.$2,
                                  style: const TextStyle(fontSize: 10),
                                )))
                        .toList()),
                    selected: sp.selectedChords),
                const SizedBox(
                  height: 25,
                ),
                Text(
                    'Spell Chord: ${sp.chord?.root}${chordPatternToType(sp.chord!.pattern)}',
                    style: const TextStyle(fontSize: 26)),
                Text(sp.message, style: const TextStyle(fontSize: 24)),
                sp.guesses.isEmpty
                    ? const Text("Entries: [ ]")
                    : Text("Entries: ${sp.guesses}"),
                const SizedBox(
                  height: 25,
                ),
                sp.guess >= sp.chord!.items.length
                    ? ElevatedButton(
                        onPressed: () {
                          ref.read(settingsProvider.notifier).nextChord();
                        },
                        child: const Text("Next Chord"))
                    : const ChromaticWidget(),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(settingsProvider.notifier).nextChord();
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
