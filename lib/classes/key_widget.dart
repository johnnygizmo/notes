import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/providers/settings_provider.dart';

class KeyWidget extends ConsumerWidget {
  const KeyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
       
          SizedBox(
            width: 600,
            height: 100,
            child: 



GridButton(
                      items: const [
                        [
                          GridButtonItem(title: "None", value: "0 "),
                          GridButtonItem(title: "1 $sharp", value: "1s"),
                          GridButtonItem(title: "2 $sharp", value: "2s"),
                          GridButtonItem(title: "3 $sharp", value: "3s"),
                          GridButtonItem(title: "4 $sharp", value: "4s"),
                          GridButtonItem(title: "5 $sharp", value: "5s"),
                          GridButtonItem(title: "6 $sharp", value: "6s"),
                          GridButtonItem(title: "7 $sharp", value: "7s"),
                        ],
                        [
                          GridButtonItem(title: "", value: ""),
                          GridButtonItem(title: "1 $flat", value: "1f"),
                          GridButtonItem(title: "2 $flat", value: "2f"),
                          GridButtonItem(title: "3 $flat", value: "3f"),
                          GridButtonItem(title: "4 $flat", value: "4f"),
                          GridButtonItem(title: "5 $flat", value: "5f"),
                          GridButtonItem(title: "6 $flat", value: "6f"),
                          GridButtonItem(title: "7 $flat", value: "7f"),
                        ],
                      ],
                      onPressed: (value) {
                        if (value != "") {
                          ref
                              .read(settingsProvider.notifier)
                              .guessKey(int.parse(value[0]), value[1], ref);
                        }
                      })
                   






          )
        ],
      ),
    );
  }
}
