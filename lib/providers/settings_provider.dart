import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_notes/music_notes.dart';
import 'package:notes/classes/settings_state.dart';
import 'package:notes/providers/shared_preferences_provider.dart';
import 'package:music_notes/music_notes.dart' as mn;

enum GuessType { scale, chord, interval }

String? eventToGuess(value) {
  String mod = "";
  if (HardwareKeyboard.instance
      .isPhysicalKeyPressed(PhysicalKeyboardKey.shiftLeft)) {
    mod = "b";
  } else if (HardwareKeyboard.instance
      .isPhysicalKeyPressed(PhysicalKeyboardKey.shiftRight)) {
    mod = "#";
  } else {
    mod = "";
  }
  if (value is KeyDownEvent) {
    return null;
  }
  if (value.logicalKey.keyLabel == "A") {
    return "A$mod";
  } else if (value.logicalKey.keyLabel == "B") {
    return "B$mod";
  } else if (value.logicalKey.keyLabel == "C") {
    return "C$mod";
  } else if (value.logicalKey.keyLabel == "D") {
    return "D$mod";
  } else if (value.logicalKey.keyLabel == "E") {
    return "E$mod";
  } else if (value.logicalKey.keyLabel == "F") {
    return "F$mod";
  } else if (value.logicalKey.keyLabel == "G") {
    return "G$mod";
  }
  return null;
}

const List<(ScalePattern, String)> scaleOptions = <(ScalePattern, String)>[
  (ScalePattern.ionian, "Major"),
  (ScalePattern.dorian, "Dorian"),
  (ScalePattern.phrygian, "Phrygian"),
  (ScalePattern.lydian, "Lydian"),
  (ScalePattern.mixolydian, "Mixolydian"),
  (ScalePattern.aeolian, "Minor"),
  (ScalePattern.locrian, "Locrian"),
  (ScalePattern.minorPentatonic, "Minor Pent."),
  (ScalePattern.majorPentatonic, "Major Pent."),
];

List<(ChordPattern, String)> chordOptions = <(ChordPattern, String)>[
  (ChordPattern.majorTriad, "Major"),
  (ChordPattern.majorTriad.add7(ImperfectQuality.major), "maj7"),
  (ChordPattern.majorTriad.add7(ImperfectQuality.minor), "7"),
  (ChordPattern.minorTriad, "Minor"),
  (ChordPattern.minorTriad.add7(ImperfectQuality.minor), "min7"),
  (ChordPattern.diminishedTriad, "dim"),
  (ChordPattern.diminishedTriad.add7(ImperfectQuality.minor), "∅7"),
  (ChordPattern.diminishedTriad.add7(ImperfectQuality.diminished), "dim7"),
  (ChordPattern.augmentedTriad, "+"),
  (ChordPattern.augmentedTriad.add7(ImperfectQuality.minor), "+7"),
];

String chordPatternToType(ChordPattern p) {
  if (p.isMajor) {
    if (p.modifiers.isEmpty) {
      return "maj";
    }
    if (p.modifiers[0] == mn.Interval.m7) {
      return "7";
    }
    if (p.modifiers[0] == mn.Interval.M7) {
      return "maj7";
    }
  } else if (p.isMinor) {
    if (p.modifiers.isEmpty) {
      return "min";
    }
    if (p.modifiers[0] == mn.Interval.m7) {
      return "min7";
    }
    if (p.modifiers[0] == mn.Interval.M7) {
      return "min-maj7";
    }
  } else if (p.isDiminished) {
    if (p.modifiers.isEmpty) {
      return "dim";
    }
    if (p.modifiers[0] == mn.Interval.m7) {
      return "∅7";
    }
    if (p.modifiers[0] == mn.Interval.d7) {
      return "dim7";
    }
  } else if (p.isAugmented) {
    if (p.modifiers.isEmpty) {
      return "aug";
    }
    if (p.modifiers[0] == mn.Interval.m7) {
      return "+7";
    }
  }
  return "";
}

class SettingsProviderNotifier extends StateNotifier<SettingsState> {
  SettingsProviderNotifier()
      : super(SettingsState(scale: ScalePattern.major.on(Note.c)));

  void setScale(Scale<Note> scale) {
    state = state.copyWith(scale: scale);
  }

  void setChord(Chord<Note> chord) {
    state = state.copyWith(chord: chord);
  }

  void setInterval(Interval i, Note start) {
    state = state.copyWith(interval: i, startNote: start);
  }

  void guess(String note, WidgetRef ref) async {
    if (state.guessType == GuessType.interval) {
      if (state.guesses.isNotEmpty) {
        return;
      }

      Note n = Note.parse(note);
      if (n.isEnharmonicWith(state.startNote!.transposeBy(state.interval!))) {
        state = state.copyWith(message: "Correct", guesses: [n], guess: 1);
      } else {
        state = state.copyWith(message: "Incorrect");
      }
    } else if (state.guessType == GuessType.scale) {
      Note n = Note.parse(note);
      if (state.guess >= state.scale!.degrees.length) {
        return;
      }

      if (state.scale!.degrees[state.guess] == n) {
        state = state.copyWith(
            guess: state.guess + 1,
            guesses: [...state.guesses, n],
            message: "$n is Correct");
        if (state.guess == state.scale!.degrees.length) {
          state = state.copyWith(
              message: "Scale Completed", currentRun: state.currentRun + 1);

          var shp = ref.read(sharedPreferencesProvider);

          shp.whenData((data) {
            if (data.getInt("bestScale") == null) {
              data.setInt("bestScale", state.currentRun);
            } else if (state.currentRun + 1 > data.getInt("bestScale") ?? 0) {
              data.setInt("bestScale", state.currentRun);
            }
          });
        }
      } else {
        state = state.copyWith(message: "$n is incorrect", currentRun: -1);
      }
    } else if (state.guessType == GuessType.chord) {
      Note n = Note.parse(note);
      if (state.guess > state.chord!.items.length) {
        return;
      }

      if (state.chord!.items[state.guess] == n) {
        state = state.copyWith(
            guess: state.guess + 1,
            guesses: [...state.guesses, n],
            message: "$n is Correct");
        if (state.guess == state.chord!.items.length) {
          state = state.copyWith(message: "Chord Completed");
        }
      } else {
        state = state.copyWith(message: "$n is incorrect");
      }
    }
  }

  reset(GuessType type) {
    state = state.copyWith(guess: 0, guesses: [], message: "", guessType: type);
    nextChord();
    nextScale();
    nextInterval();
  }

  nextChord({bool major = true, bool minor = false}) {
    Random r = Random();
    state = state.copyWith(guess: 0, guesses: [], message: "");
    if (state.selectedChords.isEmpty) {
      state = state.copyWith(selectedChords: {ChordPattern.majorTriad});
    }
    var chordType =
        state.selectedChords.elementAt(r.nextInt(state.selectedChords.length));

    setChord(chordType
        .on(Note.c.transposeBy(Interval.fromSemitones(r.nextInt(12)))));
  }

  nextInterval() {
    Random r = Random();
    state = state.copyWith(guess: 0, guesses: [], message: "");
    Note start = Note.c.transposeBy(Interval.fromSemitones(r.nextInt(12)));
    Interval i = Interval.fromSemitones(r.nextInt(12));
    setInterval(i, start);
  }

  nextScale({bool major = true, bool minor = false}) {
    Random r = Random();
    state = state.copyWith(guess: 0, guesses: [], message: "");

    if (state.selectedScales.isEmpty) {
      state = state.copyWith(selectedScales: {ScalePattern.major});
    }

    ScalePattern scaleType =
        state.selectedScales.elementAt(r.nextInt(state.selectedScales.length));

    setScale(scaleType
        .on(Note.c.transposeBy(Interval.fromSemitones(r.nextInt(12)))));
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsProviderNotifier, SettingsState>((ref) {
  return SettingsProviderNotifier();
});
