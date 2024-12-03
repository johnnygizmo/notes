import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_notes/music_notes.dart';
import 'package:notes/classes/scale_state.dart';
import 'package:notes/providers/shared_preferences_provider.dart';

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

class ScaleProviderNotifier extends StateNotifier<ScaleState> {
  ScaleProviderNotifier()
      : super(ScaleState(scale: ScalePattern.major.on(Note.c)));

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
    List<String> types = [];
    if (major) types.add("major");
    if (minor) types.add("minor");

    Random r = Random();
    state = state.copyWith(guess: 0, guesses: [], message: "");

    int scale = r.nextInt(types.length);
    if (types[scale] == "major") {
      setChord(ChordPattern.majorTriad
          .on(Note.c.transposeBy(Interval.fromSemitones(r.nextInt(12)))));
    } else if (types[scale] == "minor") {
      setChord(ChordPattern.minorTriad
          .on(Note.c.transposeBy(Interval.fromSemitones(r.nextInt(12)))));
    }
  }

  nextInterval() {
    Random r = Random();
    state = state.copyWith(guess: 0, guesses: [], message: "");
    Note start = Note.c.transposeBy(Interval.fromSemitones(r.nextInt(12)));
    Interval i = Interval.fromSemitones(r.nextInt(12));
    setInterval(i, start);
  }

  nextScale({bool major = true, bool minor = false}) {
    List<String> types = [];
    if (major) types.add("major");
    if (minor) types.add("minor");

    Random r = Random();
    state = state.copyWith(guess: 0, guesses: [], message: "");

    int scale = r.nextInt(types.length);
    if (types[scale] == "major") {
      setScale(ScalePattern.major
          .on(Note.c.transposeBy(Interval.fromSemitones(r.nextInt(12)))));
    } else if (types[scale] == "minor") {
      setScale(ScalePattern.naturalMinor
          .on(Note.c.transposeBy(Interval.fromSemitones(r.nextInt(12)))));
    }
  }
}

final scaleProvider =
    StateNotifierProvider<ScaleProviderNotifier, ScaleState>((ref) {
  return ScaleProviderNotifier();
});
