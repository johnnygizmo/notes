import 'dart:convert';

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

Map<ScalePattern, List<String>> scaleHelpers = {
  ScalePattern.ionian: ["1", "2", "3", "4", "5", "6", "7"],
  ScalePattern.dorian: ["1", "2", "${flat}3", "4", "5", "6", "${flat}7"],
  ScalePattern.phrygian: [
    "1",
    "${flat}2",
    "${flat}3",
    "4",
    "5",
    "${flat}6",
    "${flat}7"
  ],
  ScalePattern.lydian: ["1", "2", "3", "${sharp}4", "5", "6", "7"],
  ScalePattern.mixolydian: ["1", "2", "3", "4", "5", "6", "${flat}7"],
  ScalePattern.aeolian: [
    "1",
    "2",
    "${flat}3",
    "4",
    "5",
    "${flat}6",
    "${flat}7"
  ],
  ScalePattern.locrian: [
    "1",
    "${flat}2",
    "${flat}3",
    "4",
    "${flat}5",
    "${flat}6",
    "${flat}7"
  ],
  ScalePattern.majorPentatonic: ["1", "2", "3", "5", "6"],
  ScalePattern.minorPentatonic: ["1", "${flat}3", "4", "5", "${flat}7"],
};

class _ScaleSpellerState extends ConsumerState<ScaleSpeller> {
  var node = FocusNode();

  @override
  void initState() {
    ref.read(settingsProvider.notifier).initLists(ref);
    super.initState();
  }

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
        backgroundColor: Colors.deepOrange,
        actions: [
          Row(
            children: [
              const Text("Scale Help: "),
              Switch(
                  value: sp.scaleHelp,
                  onChanged: (v) {
                    ref.read(settingsProvider.notifier).toggleHelp();
                  })
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: KeyboardListener(
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
                const SizedBox(
                  height: 25,
                ),
                SegmentedButton<ScalePattern>(
                    multiSelectionEnabled: true,
                    onSelectionChanged: (p0) {
                      ref
                          .read(settingsProvider.notifier)
                          .updateSelectedScales(p0);
                      var intList = (p0.map(
                        (e) => e.toBinary().$1,
                      )).toList();
                      var scalePatternList = jsonEncode(intList);
                      ref.read(sharedPreferencesProvider).whenData((sp) {
                        sp.setString("selectedScales", scalePatternList);
                      });
                    },
                    segments: (scaleOptions
                        .map(((ScalePattern, String) scale) =>
                            ButtonSegment<ScalePattern>(
                                value: scale.$1,
                                label: Text(
                                  softWrap: true,
                                  maxLines: 3,
                                  scale.$2,
                                  style: const TextStyle(fontSize: 10),
                                )))
                        .toList()),
                    selected: sp.selectedScales),
                const SizedBox(
                  height: 25,
                ),
                Text(
                    'Spell Scale: ${sp.scale?.degrees[0]} ${sp.scale!.pattern.name}',
                    style: const TextStyle(fontSize: 26)),
                Text(sp.message, style: const TextStyle(fontSize: 24)),
                sp.scaleHelp
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Scale Variation from Major"),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: scaleHelpers[sp.scale?.pattern]!
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ))
                                    .toList()),
                          ],
                        ),
                      )
                    : Container(),
                sp.guesses.isEmpty
                    ? const Text("Entries: [ ]")
                    : Text("Entries: ${sp.guesses}",
                        style: const TextStyle(fontSize: 22)),
                const SizedBox(
                  height: 25,
                ),
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
                const SizedBox(
                  height: 25,
                ),
                Text("Best Streak: $best"),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(settingsProvider.notifier).nextScale();
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
