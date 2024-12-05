import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //         onPressed: () {
          //           ref.read(settingsProvider.notifier).guess("A", ref);
          //         },
          //         child: const Text("A")),
          //     Column(
          //       children: [
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("A$sharp", ref);
          //             },
          //             child: const Text("A♯")),
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("B$flat", ref);
          //             },
          //             child: const Text("B$flat")),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("$flat", ref);
          //             },
          //             child: const Text("$flat")),
          //         ElevatedButton(
          //             style: ButtonStyle(
          //                 backgroundColor:
          //                     WidgetStateProperty.all(Colors.grey[300])),
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("C$flat", ref);
          //             },
          //             child: const Text("C$flat")),
          //       ],
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         ElevatedButton(
          //           style: ButtonStyle(
          //               backgroundColor:
          //                   WidgetStateProperty.all(Colors.grey[300])),
          //           onPressed: () {
          //             ref.read(settingsProvider.notifier).guess("B$sharp", ref);
          //           },
          //           child: const Text("B$sharp"),
          //         ),
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("C", ref);
          //             },
          //             child: const Text("C")),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("C$sharp", ref);
          //             },
          //             child: const Text("C♯")),
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("D$flat", ref);
          //             },
          //             child: const Text("D$flat")),
          //       ],
          //     ),
          //     ElevatedButton(
          //         onPressed: () {
          //           ref.read(settingsProvider.notifier).guess("D", ref);
          //         },
          //         child: const Text("D")),
          //     Column(
          //       children: [
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("D$sharp", ref);
          //             },
          //             child: const Text("D♯")),
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("E$flat", ref);
          //             },
          //             child: const Text("E$flat")),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("E", ref);
          //             },
          //             child: const Text("E")),
          //         ElevatedButton(
          //             style: ButtonStyle(
          //                 backgroundColor:
          //                     WidgetStateProperty.all(Colors.grey[300])),
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("F$flat", ref);
          //             },
          //             child: const Text("F$flat")),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         ElevatedButton(
          //             style: ButtonStyle(
          //                 backgroundColor:
          //                     WidgetStateProperty.all(Colors.grey[300])),
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("E$sharp", ref);
          //             },
          //             child: const Text("E♯")),
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("F", ref);
          //             },
          //             child: const Text("F")),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("F$sharp", ref);
          //             },
          //             child: const Text("F♯")),
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("G$flat", ref);
          //             },
          //             child: const Text("G$flat")),
          //       ],
          //     ),
          //     ElevatedButton(
          //         onPressed: () {
          //           ref.read(settingsProvider.notifier).guess("G", ref);
          //         },
          //         child: const Text("G")),
          //     Column(
          //       children: [
          //         SizedBox(
          //           width: 40,
          //           child: ElevatedButton(
          //               onPressed: () {
          //                 ref.read(settingsProvider.notifier).guess("G$sharp", ref);
          //               },
          //               child: const Text("G♯")),
          //         ),
          //         ElevatedButton(
          //             onPressed: () {
          //               ref.read(settingsProvider.notifier).guess("A$flat", ref);
          //             },
          //             child: const Text("A$flat")),
          //       ],
          //     ),
          //   ],
          // ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Keyboard Keys can be used, with Left Shift for Flat and Right Shift for Sharp")
            ],
          ),
          SizedBox(
            width: 600,
            height: 100,
            child: GridButton(
              items: [
                [
                  const GridButtonItem(title: "A$sharp"),
                  GridButtonItem(
                      title: "B$sharp",
                      color: Colors.grey[200],
                      textStyle: TextStyle(
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic)),
                  const GridButtonItem(title: "C$sharp"),
                  const GridButtonItem(title: "D$sharp"),
                  GridButtonItem(
                      title: "E$sharp",
                      color: Colors.grey[200],
                      textStyle: TextStyle(
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic)),
                  const GridButtonItem(title: "F$sharp"),
                  const GridButtonItem(title: "G$sharp"),
                ],
                const [
                  GridButtonItem(title: "A"),
                  GridButtonItem(title: "B"),
                  GridButtonItem(title: "C"),
                  GridButtonItem(title: "D"),
                  GridButtonItem(title: "E"),
                  GridButtonItem(title: "F"),
                  GridButtonItem(title: "G"),
                ],
                [
                  const GridButtonItem(title: "A$flat"),
                  const GridButtonItem(title: "B$flat"),
                  GridButtonItem(
                      title: "C$flat",
                      color: Colors.grey[200],
                      textStyle: TextStyle(
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic)),
                  const GridButtonItem(title: "D$flat"),
                  const GridButtonItem(title: "E$flat"),
                  GridButtonItem(
                      title: "F$flat",
                      color: Colors.grey[200],
                      textStyle: TextStyle(
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic)),
                  const GridButtonItem(title: "G$flat"),
                ],
              ],
              onPressed: (value) {
                if (value != "") {
                  ref
                      .read(settingsProvider.notifier)
                      .guess(value.toString(), ref);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
