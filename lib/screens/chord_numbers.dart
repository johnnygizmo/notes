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

    var groupedNumbers = _chunk(sp.numberSteps, 4);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Numbers Charts'),
          backgroundColor: Colors.deepOrange),
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
                SizedBox(
                  width: 400,
                  child: Center(
                    child: GridView.builder(
                        // primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              2.5, // Adjust aspect ratio as needed
                        ),
                        itemCount: groupedNumbers.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final group = groupedNumbers[index];
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: group
                                  .map((g) => Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "${g.accidental}${g.arabic.toString()}${tonality[g.defaultTonality]}",
                                          style: const TextStyle(fontSize: 26),
                                        ),
                                      ))
                                  .toList());
                        }),
                  ),
                ),
                Text(sp.message, style: const TextStyle(fontSize: 24)),
                sp.guesses.isEmpty
                    ? const Text("Root Notes: [ ]")
                    : Text("Root Notes: ${sp.guesses}"),
                const SizedBox(
                  height: 25,
                ),
                sp.guess >= sp.numberSteps.length
                    ? ElevatedButton(
                        onPressed: () {
                          ref.read(settingsProvider.notifier).nextInterval();
                        },
                        child: const Text("Next Chart"))
                    : const ChromaticWidget(),
                const SizedBox(
                  height: 25,
                ),
                Text("Errors: ${sp.errors}"),
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
      ),
    );
  }
}

List<List<NumberStep>> _chunk(List<NumberStep> list, int size) {
  List<List<NumberStep>> chunks = [];
  for (var i = 0; i < list.length; i += size) {
    chunks
        .add(list.sublist(i, i + size > list.length ? list.length : i + size));
  }
  return chunks;
}
