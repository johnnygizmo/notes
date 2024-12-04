// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  Scale<Note>? get scale => throw _privateConstructorUsedError;
  Chord<Note>? get chord => throw _privateConstructorUsedError;
  Interval? get interval => throw _privateConstructorUsedError;
  Note? get startNote => throw _privateConstructorUsedError;
  dynamic get currentRun => throw _privateConstructorUsedError;
  dynamic get chordStreak => throw _privateConstructorUsedError;
  dynamic get scaleStreak => throw _privateConstructorUsedError;
  dynamic get intervalStreak => throw _privateConstructorUsedError;
  List<Note> get guesses => throw _privateConstructorUsedError;
  int get guess => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  GuessType get guessType => throw _privateConstructorUsedError;
  Set<ChordPattern> get selectedChords => throw _privateConstructorUsedError;
  Set<ScalePattern> get selectedScales => throw _privateConstructorUsedError;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call(
      {Scale<Note>? scale,
      Chord<Note>? chord,
      Interval? interval,
      Note? startNote,
      dynamic currentRun,
      dynamic chordStreak,
      dynamic scaleStreak,
      dynamic intervalStreak,
      List<Note> guesses,
      int guess,
      String message,
      GuessType guessType,
      Set<ChordPattern> selectedChords,
      Set<ScalePattern> selectedScales});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = freezed,
    Object? chord = freezed,
    Object? interval = freezed,
    Object? startNote = freezed,
    Object? currentRun = freezed,
    Object? chordStreak = freezed,
    Object? scaleStreak = freezed,
    Object? intervalStreak = freezed,
    Object? guesses = null,
    Object? guess = null,
    Object? message = null,
    Object? guessType = null,
    Object? selectedChords = null,
    Object? selectedScales = null,
  }) {
    return _then(_value.copyWith(
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as Scale<Note>?,
      chord: freezed == chord
          ? _value.chord
          : chord // ignore: cast_nullable_to_non_nullable
              as Chord<Note>?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as Interval?,
      startNote: freezed == startNote
          ? _value.startNote
          : startNote // ignore: cast_nullable_to_non_nullable
              as Note?,
      currentRun: freezed == currentRun
          ? _value.currentRun
          : currentRun // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chordStreak: freezed == chordStreak
          ? _value.chordStreak
          : chordStreak // ignore: cast_nullable_to_non_nullable
              as dynamic,
      scaleStreak: freezed == scaleStreak
          ? _value.scaleStreak
          : scaleStreak // ignore: cast_nullable_to_non_nullable
              as dynamic,
      intervalStreak: freezed == intervalStreak
          ? _value.intervalStreak
          : intervalStreak // ignore: cast_nullable_to_non_nullable
              as dynamic,
      guesses: null == guesses
          ? _value.guesses
          : guesses // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      guess: null == guess
          ? _value.guess
          : guess // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      guessType: null == guessType
          ? _value.guessType
          : guessType // ignore: cast_nullable_to_non_nullable
              as GuessType,
      selectedChords: null == selectedChords
          ? _value.selectedChords
          : selectedChords // ignore: cast_nullable_to_non_nullable
              as Set<ChordPattern>,
      selectedScales: null == selectedScales
          ? _value.selectedScales
          : selectedScales // ignore: cast_nullable_to_non_nullable
              as Set<ScalePattern>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Scale<Note>? scale,
      Chord<Note>? chord,
      Interval? interval,
      Note? startNote,
      dynamic currentRun,
      dynamic chordStreak,
      dynamic scaleStreak,
      dynamic intervalStreak,
      List<Note> guesses,
      int guess,
      String message,
      GuessType guessType,
      Set<ChordPattern> selectedChords,
      Set<ScalePattern> selectedScales});
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = freezed,
    Object? chord = freezed,
    Object? interval = freezed,
    Object? startNote = freezed,
    Object? currentRun = freezed,
    Object? chordStreak = freezed,
    Object? scaleStreak = freezed,
    Object? intervalStreak = freezed,
    Object? guesses = null,
    Object? guess = null,
    Object? message = null,
    Object? guessType = null,
    Object? selectedChords = null,
    Object? selectedScales = null,
  }) {
    return _then(_$SettingsStateImpl(
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as Scale<Note>?,
      chord: freezed == chord
          ? _value.chord
          : chord // ignore: cast_nullable_to_non_nullable
              as Chord<Note>?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as Interval?,
      startNote: freezed == startNote
          ? _value.startNote
          : startNote // ignore: cast_nullable_to_non_nullable
              as Note?,
      currentRun: freezed == currentRun ? _value.currentRun! : currentRun,
      chordStreak: freezed == chordStreak ? _value.chordStreak! : chordStreak,
      scaleStreak: freezed == scaleStreak ? _value.scaleStreak! : scaleStreak,
      intervalStreak:
          freezed == intervalStreak ? _value.intervalStreak! : intervalStreak,
      guesses: null == guesses
          ? _value._guesses
          : guesses // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      guess: null == guess
          ? _value.guess
          : guess // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      guessType: null == guessType
          ? _value.guessType
          : guessType // ignore: cast_nullable_to_non_nullable
              as GuessType,
      selectedChords: null == selectedChords
          ? _value._selectedChords
          : selectedChords // ignore: cast_nullable_to_non_nullable
              as Set<ChordPattern>,
      selectedScales: null == selectedScales
          ? _value._selectedScales
          : selectedScales // ignore: cast_nullable_to_non_nullable
              as Set<ScalePattern>,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl(
      {this.scale,
      this.chord,
      this.interval,
      this.startNote,
      this.currentRun = 0,
      this.chordStreak = 0,
      this.scaleStreak = 0,
      this.intervalStreak = 0,
      final List<Note> guesses = const <Note>[],
      this.guess = 0,
      this.message = "",
      this.guessType = GuessType.scale,
      final Set<ChordPattern> selectedChords = const <ChordPattern>{},
      final Set<ScalePattern> selectedScales = const <ScalePattern>{}})
      : _guesses = guesses,
        _selectedChords = selectedChords,
        _selectedScales = selectedScales;

  @override
  final Scale<Note>? scale;
  @override
  final Chord<Note>? chord;
  @override
  final Interval? interval;
  @override
  final Note? startNote;
  @override
  @JsonKey()
  final dynamic currentRun;
  @override
  @JsonKey()
  final dynamic chordStreak;
  @override
  @JsonKey()
  final dynamic scaleStreak;
  @override
  @JsonKey()
  final dynamic intervalStreak;
  final List<Note> _guesses;
  @override
  @JsonKey()
  List<Note> get guesses {
    if (_guesses is EqualUnmodifiableListView) return _guesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guesses);
  }

  @override
  @JsonKey()
  final int guess;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final GuessType guessType;
  final Set<ChordPattern> _selectedChords;
  @override
  @JsonKey()
  Set<ChordPattern> get selectedChords {
    if (_selectedChords is EqualUnmodifiableSetView) return _selectedChords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedChords);
  }

  final Set<ScalePattern> _selectedScales;
  @override
  @JsonKey()
  Set<ScalePattern> get selectedScales {
    if (_selectedScales is EqualUnmodifiableSetView) return _selectedScales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedScales);
  }

  @override
  String toString() {
    return 'SettingsState(scale: $scale, chord: $chord, interval: $interval, startNote: $startNote, currentRun: $currentRun, chordStreak: $chordStreak, scaleStreak: $scaleStreak, intervalStreak: $intervalStreak, guesses: $guesses, guess: $guess, message: $message, guessType: $guessType, selectedChords: $selectedChords, selectedScales: $selectedScales)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.chord, chord) || other.chord == chord) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.startNote, startNote) ||
                other.startNote == startNote) &&
            const DeepCollectionEquality()
                .equals(other.currentRun, currentRun) &&
            const DeepCollectionEquality()
                .equals(other.chordStreak, chordStreak) &&
            const DeepCollectionEquality()
                .equals(other.scaleStreak, scaleStreak) &&
            const DeepCollectionEquality()
                .equals(other.intervalStreak, intervalStreak) &&
            const DeepCollectionEquality().equals(other._guesses, _guesses) &&
            (identical(other.guess, guess) || other.guess == guess) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.guessType, guessType) ||
                other.guessType == guessType) &&
            const DeepCollectionEquality()
                .equals(other._selectedChords, _selectedChords) &&
            const DeepCollectionEquality()
                .equals(other._selectedScales, _selectedScales));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      scale,
      chord,
      interval,
      startNote,
      const DeepCollectionEquality().hash(currentRun),
      const DeepCollectionEquality().hash(chordStreak),
      const DeepCollectionEquality().hash(scaleStreak),
      const DeepCollectionEquality().hash(intervalStreak),
      const DeepCollectionEquality().hash(_guesses),
      guess,
      message,
      guessType,
      const DeepCollectionEquality().hash(_selectedChords),
      const DeepCollectionEquality().hash(_selectedScales));

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {final Scale<Note>? scale,
      final Chord<Note>? chord,
      final Interval? interval,
      final Note? startNote,
      final dynamic currentRun,
      final dynamic chordStreak,
      final dynamic scaleStreak,
      final dynamic intervalStreak,
      final List<Note> guesses,
      final int guess,
      final String message,
      final GuessType guessType,
      final Set<ChordPattern> selectedChords,
      final Set<ScalePattern> selectedScales}) = _$SettingsStateImpl;

  @override
  Scale<Note>? get scale;
  @override
  Chord<Note>? get chord;
  @override
  Interval? get interval;
  @override
  Note? get startNote;
  @override
  dynamic get currentRun;
  @override
  dynamic get chordStreak;
  @override
  dynamic get scaleStreak;
  @override
  dynamic get intervalStreak;
  @override
  List<Note> get guesses;
  @override
  int get guess;
  @override
  String get message;
  @override
  GuessType get guessType;
  @override
  Set<ChordPattern> get selectedChords;
  @override
  Set<ScalePattern> get selectedScales;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
