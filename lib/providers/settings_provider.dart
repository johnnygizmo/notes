import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_notes/music_notes.dart';
import 'package:notes/classes/number_step.dart';
import 'package:notes/classes/settings_state.dart';
import 'package:notes/providers/shared_preferences_provider.dart';
import 'package:music_notes/music_notes.dart' as mn;
import 'package:notes/screens/chord_numbers.dart';

enum GuessType { scale, chord, interval, keySignature, number }

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

const List<(TonalMode, String)> keyOptions = <(TonalMode, String)>[
  (TonalMode.major, "Major"),
  (TonalMode.minor, "Minor"),
];

const flat = "\u266D";
const natural = "\u266E";
const sharp = "\u266F";

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


Map<int,NumberStep> numberStepsOptions = {
0: NumberStep(semitone: 0, interval: "PU", arabic: "1", roman: "I", accidental: "", defaultTonality: "major"),
1: NumberStep(semitone: 0, interval: "PU", arabic: "1", roman: "I", accidental: ""),
  2: NumberStep(semitone: 1, interval: "m2", arabic: "1", roman: "I", accidental: sharp),

  3: NumberStep(semitone: 1, interval: "m2", arabic: "2", roman: "II", accidental: flat),
  4: NumberStep(semitone: 2, interval: "M2", arabic: "2", roman: "II", accidental: "", defaultTonality: "minor"),
  5: NumberStep(semitone: 2, interval: "M2", arabic: "2", roman: "II", accidental: ""),
  6: NumberStep(semitone: 3, interval: "m3", arabic: "2", roman: "II", accidental: sharp),
  
  7: NumberStep(semitone: 4, interval: "m3", arabic: "3", roman: "III", accidental: flat),
  8: NumberStep(semitone: 4, interval: "M3", arabic: "3", roman: "III", accidental: "", defaultTonality: "minor"),
  9: NumberStep(semitone: 4, interval: "M3", arabic: "3", roman: "III", accidental: "", ),
  
  10: NumberStep(semitone: 5, interval: "P4", arabic: "4", roman: "IV", accidental: "", defaultTonality: "major"),
  11: NumberStep(semitone: 5, interval: "P4", arabic: "4", roman: "IV", accidental: ""),
  12: NumberStep(semitone: 6, interval: "A4", arabic: "4", roman: "IV", accidental: sharp),
  
  13: NumberStep(semitone: 6, interval: "d5", arabic: "5", roman: "V", accidental: flat),
  14: NumberStep(semitone: 7, interval: "P5", arabic: "5", roman: "V", accidental: "", defaultTonality: "major"),
  15: NumberStep(semitone: 7, interval: "P5", arabic: "5", roman: "V", accidental: "", ),
  16: NumberStep(semitone: 8, interval: "m6", arabic: "5", roman: "V", accidental: sharp),
  
  17: NumberStep(semitone: 8, interval: "m6", arabic: "6", roman: "VI", accidental: flat),
  18: NumberStep(semitone: 9, interval: "M6", arabic: "6", roman: "VI", accidental: "", defaultTonality: "minor"),
  19: NumberStep(semitone: 9, interval: "M6", arabic: "6", roman: "VI", accidental: "",),
  20: NumberStep(semitone: 10, interval: "m7", arabic: "6", roman: "VI", accidental: sharp),
  
  21: NumberStep(semitone: 10, interval: "m7", arabic: "7", roman: "VII", accidental: flat),
  22: NumberStep(semitone: 11, interval: "M7", arabic: "7", roman: "VII", accidental: "", defaultTonality: "diminshed"),
  23: NumberStep(semitone: 11, interval: "M7", arabic: "7", roman: "VII", accidental: "",),
};


Map<String,Set<int>> numberStepGroups = {
  "basic": {0,10,14,18},
  "diatonic":{0,4,8,10,14,18,22},
  "all":{1,2,3,5,6,7,9,11,12, 13,15,16, 17,19,20,21,23},
};


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

  void setKey(Key key) {
    state = state.copyWith(key: key);
  }

  void guessKey(int num, String acc, WidgetRef ref) {
    bool correct = false;

    if (num == 0 && state.key!.signature.notes.isEmpty) {
      correct = true;
    }
    if (num > 0 && state.key!.signature.notes.isNotEmpty) {
      if ((state.key!.signature.notes[0].accidental.isSharp && acc == "s") ||
          (state.key!.signature.notes[0].accidental.isFlat && acc == "f")) {
        if (num == state.key!.signature.notes.length) {
          correct = true;
        }
      }
    }

    if (correct) {
      if (num == 0) {
        state = state.copyWith(
            guesses: state.key!.signature.notes,
            guess: state.key!.signature.notes.length,
            message: "No Sharps or Flats is Correct");
      } else {
        state = state.copyWith(
            guesses: state.key!.signature.notes,
            guess: state.key!.signature.notes.length,
            message:
                "$num ${acc == "s" ? num == 1 ? "sharp" : "sharps" : num == 1 ? "flat" : "flats"} is Correct");
      }
    } else {
      state = state.copyWith(message: "Try Again");
    }
  }

  void guessKeySignature(String note, WidgetRef ref) {
    Note n = Note.parse(note);
    if (state.guess >= state.key!.signature.notes.length) {
      return;
    }
    if (state.key!.signature.notes[state.guess] == n) {
      state = state.copyWith(
          guess: state.guess + 1,
          guesses: [...state.guesses, n],
          message: "$n is Correct");
      if (state.guess == state.key!.signature.notes.length) {
        state = state.copyWith(
            message: "Key Completed", currentRun: state.currentRun + 1);
      }
    } else {
      state = state.copyWith(message: "$n is incorrect", currentRun: -1);
    }
  }

  guessInterval(String note, WidgetRef ref) {
    if (state.guesses.isNotEmpty) {
      return;
    }

    Note n = Note.parse(note);
    if (n.isEnharmonicWith(state.startNote!.transposeBy(state.interval!))) {
      state = state.copyWith(message: "Correct", guesses: [n], guess: 1);
    } else {
      state = state.copyWith(message: "Incorrect");
    }
  }

  void guessScale(String note, WidgetRef ref) {
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
  }

  void guessChord(String note, WidgetRef ref) {
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

void guessNumber(String note, WidgetRef ref) {
    Note n = Note.parse(note);
    if (state.guess > state.numberSteps.length) {
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



  void guess(String note, WidgetRef ref) async {
    switch (state.guessType) {
      case GuessType.keySignature:
        guessKeySignature(note, ref);
        break;
      case GuessType.interval:
        guessInterval(note, ref);
        break;
      case GuessType.scale:
        guessScale(note, ref);
        break;
      case GuessType.chord:
        guessChord(note, ref);
        break;
      case GuessType.number:
        guessNumber(note, ref);
        break;
    }
  }

  reset(GuessType type) {
    state = state.copyWith(guess: 0, guesses: [], message: "", guessType: type);
    nextChord();
    nextScale();
    nextInterval();
    nextKey();
    nextNumber();
  }

  nextNumber(){
    Random r = Random();
    state = state.copyWith(guess: 0, guesses: [], message: "");
    List<NumberStep> numberSteps = [];
    for(int i = 0; i < state.numberCount; i++){
      var listChoice = r.nextInt(numberStepGroups["diatonic"]!.length);
      var stepList = numberStepGroups["diatonic"];
      numberSteps.add(numberStepsOptions[stepList?.elementAt(listChoice)]!);
    }
    state = state.copyWith(numberSteps:numberSteps);
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

  nextKey() {
    Random r = Random();
    state = state.copyWith(guess: 0, guesses: [], message: "");

    if (state.selectedKeys.isEmpty) {
      state = state.copyWith(selectedKeys: {TonalMode.major});
    }

    TonalMode mode =
        state.selectedKeys.elementAt(r.nextInt(state.selectedKeys.length));

    Note k = Note.c.transposeBy(Interval.fromSemitones(r.nextInt(12)));

    setKey(Key(k, mode));
  }

  void toggleHelp() {
    state = state.copyWith(scaleHelp: !state.scaleHelp);
  }

  void initLists(WidgetRef ref) async {
    var sp = await ref.read(sharedPreferencesProvider.future);
    List<int> scales = (jsonDecode(sp.getString("selectedScales") ?? "[2741]")
            as List<dynamic>)
        .cast<int>();
    var scaleSet = scales.map((e) => ScalePattern.fromBinary(e)).toSet();

    List<List<String>> chords =
        (jsonDecode(sp.getString("selectedChords") ?? "[[\"M3\",\"P5\"]]")
                as List<dynamic>)
            .map((e) => (e as List<dynamic>).cast<String>().toList())
            .toList();
    Set<ChordPattern> chordSet = chords.map((c) {
      ChordPattern cp = ChordPattern(c.map((i) => Interval.parse(i)).toList());
      return cp;
    }).toSet();

    List<String> keys =
        (jsonDecode(sp.getString("selectedKeys") ?? "[\"major\"]")
                as List<dynamic>)
            .cast<String>().toList();
    
    Set<TonalMode> keySet = {};
    for (var k in keys) {
      if(k == "major"){
        keySet.add(TonalMode.major);
      } 
      if(k == "minor") {
        keySet.add(TonalMode.minor);
      }
    }


    state = state.copyWith(
        selectedScales: scaleSet,
        selectedChords: chordSet,
        selectedKeys: keySet);
  }

  void updateSelectedScales(Set<ScalePattern> scales) {
    state = state.copyWith(selectedScales: scales);
  }

  void updateSelectedChords(Set<ChordPattern> chords, WidgetRef ref) async {
    var patterns = chords.map((c) {
      return c.intervals.map((i) => i.toString()).toList();
    }).toList();
    var sp = await ref.read(sharedPreferencesProvider.future);
    sp.setString("selectedChords", jsonEncode(patterns));

    state = state.copyWith(selectedChords: chords);
  }

  void updateSelectedKeys(Set<TonalMode> keys, WidgetRef ref) async {
    var sp = await ref.read(sharedPreferencesProvider.future);
    sp.setString(
        "selectedChords", jsonEncode(keys.map((k) => k.toString()).toList()));
    state = state.copyWith(selectedKeys: keys);
  }

  void updateSelectedIntervals() {}
}

final settingsProvider =
    StateNotifierProvider<SettingsProviderNotifier, SettingsState>((ref) {
  return SettingsProviderNotifier();
});
