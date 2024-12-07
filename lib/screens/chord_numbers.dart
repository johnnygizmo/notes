import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/classes/number_step.dart';
import 'package:notes/providers/settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChordNumbers extends ConsumerStatefulWidget {
  const ChordNumbers({super.key});

  @override
  ConsumerState<ChordNumbers> createState() => _ChordNumbersState();
}

class _ChordNumbersState extends ConsumerState<ChordNumbers> {
  var node = FocusNode();

  @override
  Widget build(BuildContext context) {
    var sp = ref.watch(settingsProvider);
    var r = Random();
    return Scaffold(
      appBar: AppBar(
          title: const Text('Numbers Charts'),
          backgroundColor: Colors.deepOrange),
      body: KeyboardListener(
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Chart is in the key of ${sp.scale?.degrees.first.toString()} major",
                    style: TextStyle(fontSize: 26),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...sp.numberSteps.asMap().entries.map<Widget>((entry) {
                    int index = entry.key;
                    var step = entry.value;
                    List<Widget> widgets = [];

                    // Add the step's text
                    widgets.add(
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${step.accidental}${step.arabic.toString()}${tonality[step.defaultTonality]}",
                          style: const TextStyle(fontSize: 26),
                        ),
                      ),
                    );

                    if ((index + 1) % 4 == 0 &&
                        index + 1 != sp.numberSteps.length) {
                      widgets.add(const SizedBox(
                        width: 50,
                      ));
                    }

                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: widgets,
                    );
                  }),
                  // Divider at the end
                ],
              ),

              Text(sp.message, style: const TextStyle(fontSize: 24)),

              sp.guesses.isEmpty
                  ? const Text("Entries: [ ]")
                  : Text("Entries: ${sp.guesses}"),
              const SizedBox(
                height: 25,
              ),
              //  Text(sp.guesses.toString(), style: const TextStyle(fontSize: 22)),
              sp.guess >= sp.numberSteps.length
                  ? ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).nextInterval();
                      },
                      child: const Text("Next Interval"))
                  : const ChromaticWidget(),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(settingsProvider.notifier).nextNumber();
                  },
                  child: const Text('Skip')),
              const SizedBox(
                height: 25,
              ),
              Text(
                  "The chord generator engine on this page is still in development"),
              Text(
                  "not all progressions will make musical sense or sound good."),
            ],
          ),
        ),
      ),
    );
  }
}
