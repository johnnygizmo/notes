import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_notes/music_notes.dart';
import 'package:notes/classes/number_step.dart';
import 'package:notes/providers/settings_provider.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    Scale<Note>? scale,
    Chord<Note>? chord,
    Interval? interval,
    Key? key,
    Note? startNote,
    @Default(16) int numberCount,
    @Default(<NumberStep>[]) List<NumberStep> numberSteps,
    @Default(0) currentRun,
    @Default(0) chordStreak,
    @Default(0) scaleStreak,
    @Default(0) intervalStreak,
    @Default(<Note>[]) List<Note> guesses,
    @Default(0) int guess,
    @Default(0) int errors,
    @Default("") String message,
    @Default(GuessType.scale) GuessType guessType,
    @Default(false) bool scaleHelp,
    @Default(<ChordPattern>{}) Set<ChordPattern> selectedChords,
    @Default(<ScalePattern>{}) Set<ScalePattern> selectedScales,
    @Default(<TonalMode>{}) Set<TonalMode> selectedKeys,
  }) = _SettingsState;
}
