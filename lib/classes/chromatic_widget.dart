import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/providers/settings_provider.dart';

class ChromaticWidget extends ConsumerWidget {
  const ChromaticWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(settingsProvider.notifier).guess("A", ref);
                  },
                  child: const Text("A")),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("A#", ref);
                      },
                      child: const Text("A♯")),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("Bb", ref);
                      },
                      child: const Text("Bb")),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("B", ref);
                      },
                      child: const Text("B")),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.grey[300])),
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("Cb", ref);
                      },
                      child: const Text("Cb")),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.grey[300])),
                    onPressed: () {
                      ref.read(settingsProvider.notifier).guess("B#", ref);
                    },
                    child: const Text("B#"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("C", ref);
                      },
                      child: const Text("C")),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("C#", ref);
                      },
                      child: const Text("C♯")),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("Db", ref);
                      },
                      child: const Text("Db")),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(settingsProvider.notifier).guess("D", ref);
                  },
                  child: const Text("D")),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("D#", ref);
                      },
                      child: const Text("D♯")),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("Eb", ref);
                      },
                      child: const Text("Eb")),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("E", ref);
                      },
                      child: const Text("E")),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.grey[300])),
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("Fb", ref);
                      },
                      child: const Text("Fb")),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.grey[300])),
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("E#", ref);
                      },
                      child: const Text("E♯")),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("F", ref);
                      },
                      child: const Text("F")),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("F#", ref);
                      },
                      child: const Text("F♯")),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("Gb", ref);
                      },
                      child: const Text("Gb")),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(settingsProvider.notifier).guess("G", ref);
                  },
                  child: const Text("G")),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("G#", ref);
                      },
                      child: const Text("G♯")),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(settingsProvider.notifier).guess("Ab", ref);
                      },
                      child: const Text("Ab")),
                ],
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Keyboard Keys can be used, with Left Shift for Flat and Right Shift for Sharp")
            ],
          )
        ],
      ),
    );
  }
}
