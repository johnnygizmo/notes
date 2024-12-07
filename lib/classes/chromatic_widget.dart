import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/providers/settings_provider.dart';

class ChromaticWidget extends ConsumerWidget {
  const ChromaticWidget({
    this.sharps = true,
    this.naturals = true,
    this.flats = true,
    super.key,
  });

  final bool sharps;
  final bool naturals;
  final bool flats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AutoSizeText(
                  "Keyboard Keys can be used, with Left Shift for Flat and Right Shift for Sharp",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              )
            ],
          ),
          SizedBox(
            width: 600,
            height: 100,
            child: GridButton(
              items: [
                if (sharps)
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
                if (naturals)
                  const [
                    GridButtonItem(title: "A"),
                    GridButtonItem(title: "B"),
                    GridButtonItem(title: "C"),
                    GridButtonItem(title: "D"),
                    GridButtonItem(title: "E"),
                    GridButtonItem(title: "F"),
                    GridButtonItem(title: "G"),
                  ],
                if (flats)
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
