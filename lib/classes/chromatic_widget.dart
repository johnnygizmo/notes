import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/providers/scaleprovider.dart';

class ChromaticWidget extends ConsumerWidget {
  const ChromaticWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                ref.read(scaleProvider.notifier).guess("A");
              },
              child: const Text("A")),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("A#");
                  },
                  child: const Text("A♯")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("Bb");
                  },
                  child: const Text("Bb")),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("B");
                  },
                  child: const Text("B")),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.grey[300])),
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("Cb");
                  },
                  child: const Text("Cb")),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.grey[300])),
                onPressed: () {
                  ref.read(scaleProvider.notifier).guess("B#");
                },
                child: Text("B#"),
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("C");
                  },
                  child: const Text("C")),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("C#");
                  },
                  child: const Text("C♯")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("Db");
                  },
                  child: const Text("Db")),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(scaleProvider.notifier).guess("D");
              },
              child: const Text("D")),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("D#");
                  },
                  child: const Text("D♯")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("Eb");
                  },
                  child: const Text("Eb")),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("E");
                  },
                  child: const Text("E")),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.grey[300])),
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("Fb");
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
                    ref.read(scaleProvider.notifier).guess("E#");
                  },
                  child: const Text("E♯")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("F");
                  },
                  child: const Text("F")),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("F#");
                  },
                  child: const Text("F♯")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("Gb");
                  },
                  child: const Text("Gb")),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(scaleProvider.notifier).guess("G");
              },
              child: const Text("G")),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("G#");
                  },
                  child: const Text("G♯")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(scaleProvider.notifier).guess("Ab");
                  },
                  child: const Text("Ab")),
            ],
          ),
        ],
      ),
    );
  }
}
