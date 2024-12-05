import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:notes/providers/settings_provider.dart';
import 'package:notes/screens/chord_speller.dart';
import 'package:notes/screens/interval_speller.dart';
import 'package:notes/screens/scale_speller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_symbols_icons/symbols_map.dart';
import 'package:material_symbols_icons/get.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(home: MainApp()),
    ),
  );
}

final iconYouTube = Icon(
  Symbols.youtube_activity,
  size: 42,
);

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Notes'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(kDebugMode
                      ? "images/background.jpg"
                      : kIsWeb
                          ? "assets/images/background.jpg"
                          : "images/background.jpg"),
                  fit: BoxFit.cover)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(settingsProvider.notifier)
                              .reset(GuessType.scale);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ScaleSpeller()));
                        },
                        child: const Text("Scale Spelling",
                            style: TextStyle(fontSize: 32))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(settingsProvider.notifier)
                              .reset(GuessType.chord);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChordSpeller()));
                        },
                        child: const Text("Chord Spelling",
                            style: TextStyle(fontSize: 32))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(settingsProvider.notifier)
                              .reset(GuessType.interval);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const IntervalSpeller()));
                        },
                        child: const Text("Interval Spelling",
                            style: TextStyle(fontSize: 32))),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          launchUrl(Uri.parse(
                              "https://www.youtube.com/@johnnymatthewsmusic?sub_confirmation=1"));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: iconYouTube,
                            ),
                            const Text("Subscribe to my YouTube Channel",
                                style: TextStyle(fontSize: 32)),
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
