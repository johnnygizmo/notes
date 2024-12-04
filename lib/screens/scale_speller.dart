import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_notes/music_notes.dart';
import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/providers/settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScaleSpeller extends ConsumerStatefulWidget {
  const ScaleSpeller({super.key});

  @override
  ConsumerState<ScaleSpeller> createState() => _ScaleSpellerState();
}

class _ScaleSpellerState extends ConsumerState<ScaleSpeller> {
  var node = FocusNode();

  @override
  Widget build(BuildContext context) {
    var sp = ref.watch(settingsProvider);
    if (sp.selectedScales.isEmpty) {
      sp = sp.copyWith(selectedScales: {ScalePattern.ionian});
    }

    String best = "";
    SharedPreferences? shp = ref.read(sharedPreferencesProvider).when(
      data: (data) {
        return data;
      },
      error: (error, stackTrace) {
        return null;
      },
      loading: () {
        return null;
      },
    );

    best = shp != null ? shp.getInt("bestScale").toString() : "0";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Speller'),
        backgroundColor: Colors.grey[300],
      ),
      body: KeyboardListener(
        autofocus: true,
        focusNode: node,
        onKeyEvent: (value) {
          if (value.logicalKey == LogicalKeyboardKey.space) {
            ref.read(settingsProvider.notifier).nextScale();
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
              SegmentedButton<ScalePattern>(
                  multiSelectionEnabled: true,
                  onSelectionChanged: (p0) {
                    ref.read(settingsProvider.notifier).state =
                        sp.copyWith(selectedScales: p0);
                  },
                  segments: (scaleOptions
                      .map(((ScalePattern, String) scale) =>
                          ButtonSegment<ScalePattern>(
                              value: scale.$1,
                              label: Text(
                                softWrap: true,
                                maxLines: 3,
                                scale.$2,
                                style: TextStyle(fontSize: 10),
                              )))
                      .toList()),
                  selected: sp.selectedScales),
              Text(
                  'Spell Scale: ${sp.scale?.degrees[0]} ${sp.scale!.pattern.name}',
                  style: const TextStyle(fontSize: 26)),
              Text(sp.message, style: const TextStyle(fontSize: 24)),
              sp.guesses.isEmpty
                  ? const Text("Entries: [ ]")
                  : Text("Entries: ${sp.guesses}",
                      style: const TextStyle(fontSize: 22)),
              sp.guess > sp.scale!.length
                  ? ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).nextScale();
                      },
                      child: const Text("Next Scale"))
                  : const ChromaticWidget(),
              sp.currentRun <= 0
                  ? Container()
                  : Text("Current Streak ${sp.currentRun}"),
              Text("Best Streak: $best"),
              ElevatedButton(
                  onPressed: () {
                    ref.read(settingsProvider.notifier).nextScale();
                  },
                  child: const Text('Skip')),
            ],
          ),
        ),
      ),
    );
  }
}
