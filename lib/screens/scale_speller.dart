import 'package:flutter/material.dart';
import 'package:notes/classes/chromatic_widget.dart';
import 'package:notes/providers/scaleprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/providers/shared_preferences_provider.dart';

class ScaleSpeller extends ConsumerWidget {
  const ScaleSpeller({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sp = ref.watch(scaleProvider);

    String best = "";
    var shp = ref.read(sharedPreferencesProvider).when(
          data: (data) {
            best = data.getInt("bestScale").toString();
          },
          error: (error, stackTrace) {},
          loading: () {},
        );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Speller'),
        backgroundColor: Colors.grey[300],
      ),
      body: Center(
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
    );
  }
}
