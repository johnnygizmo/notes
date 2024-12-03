import 'package:flutter/material.dart';
import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/providers/scaleprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChordSpeller extends ConsumerWidget {
  const ChordSpeller({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sp = ref.watch(scaleProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chord Speller'),
         backgroundColor: Colors.grey[300],
      ),
      body: Center(
        child: Column(
          children: [
             Text('Spell Chord ${sp.chord?.root} ${sp.chord?.pattern.abbreviation}', style: const TextStyle(fontSize: 26)),
            ElevatedButton(onPressed: (){
              ref.read(scaleProvider.notifier).nextChord();
            }, child: const Text('Skip')),
            Text(sp.message, style: const TextStyle(fontSize: 24)),
            Text(sp.guesses.toString(), style: const TextStyle(fontSize: 22)),
            
            sp.guess >= sp.chord!.items.length ? ElevatedButton(onPressed: (){
              ref.read(scaleProvider.notifier).nextChord();
            }, child: const Text("Next Chord")) : 
            const ChromaticWidget()
          ],
        ),
      ),
    );
  }
}

