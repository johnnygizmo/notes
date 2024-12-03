import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/providers/scaleprovider.dart';
import 'package:notes/screens/chord_speller.dart';
import 'package:notes/screens/scale_speller.dart';

void main() {
  runApp(
    const ProviderScope(
      child:  MaterialApp(home: MainApp()),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return 
      Scaffold(
        appBar: AppBar(
          title: const Text('Music Notes'),
         backgroundColor: Colors.grey[300],
        ),
        body: Column(
          children: [
            Expanded(
              child: ElevatedButton(onPressed: (){
                ref.read(scaleProvider.notifier).reset(GuessType.scale);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScaleSpeller()));
              }, child: const Text("Major Scales")),
            ),
             Expanded(
              child: ElevatedButton(onPressed: (){
                ref.read(scaleProvider.notifier).reset(GuessType.chord);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChordSpeller()));
              }, child: const Text("Major Chords")),
            ),
          ],
        ),
      
    );
  }
}
