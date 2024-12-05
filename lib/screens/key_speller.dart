import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:music_notes/music_notes.dart';
import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/classes/key_widget.dart';
import 'package:notes/providers/settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeySpeller extends ConsumerStatefulWidget {
  const KeySpeller({super.key});

  @override
  ConsumerState<KeySpeller> createState() => _KeySpellerState();
}

class _KeySpellerState extends ConsumerState<KeySpeller> {
  var node = FocusNode();

  @override
  Widget build(BuildContext context) {
    var sp = ref.watch(settingsProvider);
    if (sp.selectedKeys.isEmpty) {
      sp = sp.copyWith(selectedKeys: {TonalMode.major});
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
        title: const Text('Key Speller'),
        backgroundColor: Colors.deepOrange,
        // actions: [
        //   Row(
        //     children: [
        //       const Text("Scale Help: "),
        //       Switch(
        //           value: sp.scaleHelp,
        //           onChanged: (v) {
        //             ref.read(settingsProvider.notifier).toggleHelp();
        //           })
        //     ],
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: KeyboardListener(
          autofocus: true,
          focusNode: node,
          onKeyEvent: (value) {
            if (value.logicalKey == LogicalKeyboardKey.space) {
              ref.read(settingsProvider.notifier).nextKey();
            }

            String? guess = eventToGuess(value);
            if (guess != null) {
              ref.read(settingsProvider.notifier).guess(guess, ref);
            }
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                SegmentedButton<TonalMode>(
                    multiSelectionEnabled: true,
                    onSelectionChanged: (p0) {
                      ref.read(settingsProvider.notifier).state =
                          sp.copyWith(selectedKeys: p0);
                    },
                    segments: (keyOptions
                        .map(((TonalMode, String) key) =>
                            ButtonSegment<TonalMode>(
                                value: key.$1,
                                label: Text(
                                  softWrap: true,
                                  maxLines: 3,
                                  key.$2,
                                  style: const TextStyle(fontSize: 10),
                                )))
                        .toList()),
                    selected: sp.selectedKeys),
                const SizedBox(
                  height: 25,
                ),
                Text('Spell Key Signature: ${sp.key?.note} ${sp.key?.mode} ',
                    style: const TextStyle(fontSize: 26)),
                Text(sp.message, style: const TextStyle(fontSize: 24)),
              
                sp.guesses.isEmpty
                    ? const Text("Entries: [ ]")
                    : Text("Entries: ${sp.guesses}",
                        style: const TextStyle(fontSize: 22)),
                const SizedBox(
                  height: 25,
                ),
             
                if (sp.guess >= sp.key!.signature.notes.length)
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).nextKey();
                      },
                      child: const Text("Next Key Signature"))
                else ...[
                  const ChromaticWidget(
                    naturals: false,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("or"),
                  ),
                  const KeyWidget()
                ],
                ElevatedButton(
                    onPressed: () {
                      ref.read(settingsProvider.notifier).nextKey();
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
