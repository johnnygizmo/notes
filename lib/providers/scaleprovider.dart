import 'dart:math';

import 'package:music_notes/music_notes.dart';
import 'package:notes/classes/scale_state.dart';
import 'package:notes/providers/shared_preferences_provider.dart';
import 'package:riverpod/riverpod.dart';

enum GuessType { scale, chord, interval }

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

  void guess(String note) {
    if (state.guessType == GuessType.interval) {
      if (state.guesses.length > 0) {
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
      if (state.guess > state.scale!.degrees.length) {
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
