import 'package:flutter/material.dart';
import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/providers/scaleprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScaleSpeller extends ConsumerWidget {
  const ScaleSpeller({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sp = ref.watch(scaleProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Speller'),
         backgroundColor: Colors.grey[300],
      ),
      body: Center(
        child: Column(
          children: [
             Text('Spell Scale ${sp.scale?.degrees[0]}${sp.scale!.pattern.name}', style: const TextStyle(fontSize: 26)),
            ElevatedButton(onPressed: (){
              ref.read(scaleProvider.notifier).nextScale();
            }, child: const Text('Skip')),
            Text(sp.message, style: const TextStyle(fontSize: 24)),
            
            Text(sp.guesses.toString(), style: const TextStyle(fontSize: 22)),
            
            sp.guess > sp.scale!.length ? ElevatedButton(onPressed: (){
              ref.read(scaleProvider.notifier).nextScale();
            }, child: const Text("Next Scale")) : 
            const ChromaticWidget()
          ],
        ),
      ),
    );
  }
}

