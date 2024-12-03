import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_notes/music_notes.dart';
import 'package:notes/providers/scaleprovider.dart';

part 'scale_state.freezed.dart';

@freezed
class ScaleState with _$ScaleState {
  const factory ScaleState({
    Scale<Note>? scale,
    Chord<Note>? chord,
    @Default(<Note>[]) List<Note> guesses,
    @Default(0) int guess,
    @Default("") String message,
    @Default(GuessType.scale) GuessType guessType,
  }) = _ScaleState;
}