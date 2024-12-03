import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/providers/scaleprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScaleSpeller extends ConsumerStatefulWidget {
  const ScaleSpeller({super.key});

  @override
  ConsumerState<ScaleSpeller> createState() => _ScaleSpellerState();
}

class _ScaleSpellerState extends ConsumerState<ScaleSpeller> {
  String mod = "";
  var node = FocusNode();

  @override
  Widget build(BuildContext context) {
    var sp = ref.watch(scaleProvider);

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
                  'Spell Scale: ${sp.scale?.degrees[0]}${sp.scale!.pattern.name}',
                  style: const TextStyle(fontSize: 26)),
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).nextScale();
                  },
                  child: const Text('Skip')),
              Text(sp.message, style: const TextStyle(fontSize: 24)),
              Text(sp.guesses.toString(), style: const TextStyle(fontSize: 22)),
              sp.guess > sp.scale!.length
                  ? ElevatedButton(
                      onPressed: () {
                        ref.read(scaleProvider.notifier).nextScale();
                      },
                      child: const Text("Next Scale"))
                  : const ChromaticWidget(),
              sp.currentRun <= 0
                  ? Container()
                  : Text("Current Streak ${sp.currentRun}"),
              Text("Best Streak: $best")
            ],
          ),
        ),
      ),
    );
  }
}
