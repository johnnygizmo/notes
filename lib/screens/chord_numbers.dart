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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chord Numbers'),
        backgroundColor: Colors.grey[300],
      ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: 
              //   sp.numberSteps.map<Widget>((s)=>Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text(s.arabic.toString(),style: const TextStyle(fontSize: 26)),
              //   )).toList()
              // ,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    VerticalDivider(  width: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,), // Divider at the start
    ...sp.numberSteps.asMap().entries.map<Widget>((entry) {
      int index = entry.key;
      var step = entry.value;
      List<Widget> widgets = [];
      
      // Add the step's text
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            step.arabic.toString(),
            style: const TextStyle(fontSize: 26),
          ),
        ),
      );
      
      // Add a divider after every fourth step
      if ((index + 1) % 4 == 0) {
        widgets.add(VerticalDivider(  width: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,));
      }
      
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      );
    }).toList(),
    VerticalDivider(  width: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
            color: Colors.grey,), // Divider at the end
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
              ElevatedButton(
                  onPressed: () {
                    ref.read(settingsProvider.notifier).nextInterval();
                  },
                  child: const Text('Skip')),
            ],
          ),
        ),
      ),
    );
  }
}
