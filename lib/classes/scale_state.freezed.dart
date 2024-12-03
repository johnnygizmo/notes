// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scale_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScaleState {
  Scale<Note>? get scale => throw _privateConstructorUsedError;
  Chord<Note>? get chord => throw _privateConstructorUsedError;
  List<Note> get guesses => throw _privateConstructorUsedError;
  int get guess => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  GuessType get guessType => throw _privateConstructorUsedError;

  /// Create a copy of ScaleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScaleStateCopyWith<ScaleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScaleStateCopyWith<$Res> {
  factory $ScaleStateCopyWith(
          ScaleState value, $Res Function(ScaleState) then) =
      _$ScaleStateCopyWithImpl<$Res, ScaleState>;
  @useResult
  $Res call(
      {Scale<Note>? scale,
      Chord<Note>? chord,
      List<Note> guesses,
      int guess,
      String message,
      GuessType guessType});
}

/// @nodoc
class _$ScaleStateCopyWithImpl<$Res, $Val extends ScaleState>
    implements $ScaleStateCopyWith<$Res> {
  _$ScaleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScaleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = freezed,
    Object? chord = freezed,
    Object? guesses = null,
    Object? guess = null,
    Object? message = null,
    Object? guessType = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScaleStateImplCopyWith<$Res>
    implements $ScaleStateCopyWith<$Res> {
  factory _$$ScaleStateImplCopyWith(
          _$ScaleStateImpl value, $Res Function(_$ScaleStateImpl) then) =
      __$$ScaleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Scale<Note>? scale,
      Chord<Note>? chord,
      List<Note> guesses,
      int guess,
      String message,
      GuessType guessType});
}

/// @nodoc
class __$$ScaleStateImplCopyWithImpl<$Res>
    extends _$ScaleStateCopyWithImpl<$Res, _$ScaleStateImpl>
    implements _$$ScaleStateImplCopyWith<$Res> {
  __$$ScaleStateImplCopyWithImpl(
      _$ScaleStateImpl _value, $Res Function(_$ScaleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScaleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = freezed,
    Object? chord = freezed,
    Object? guesses = null,
    Object? guess = null,
    Object? message = null,
    Object? guessType = null,
  }) {
    return _then(_$ScaleStateImpl(
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as Scale<Note>?,
      chord: freezed == chord
          ? _value.chord
          : chord // ignore: cast_nullable_to_non_nullable
              as Chord<Note>?,
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
    ));
  }
}

/// @nodoc

class _$ScaleStateImpl implements _ScaleState {
  const _$ScaleStateImpl(
      {this.scale,
      this.chord,
      final List<Note> guesses = const <Note>[],
      this.guess = 0,
      this.message = "",
      this.guessType = GuessType.scale})
      : _guesses = guesses;

  @override
  final Scale<Note>? scale;
  @override
  final Chord<Note>? chord;
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

  @override
  String toString() {
    return 'ScaleState(scale: $scale, chord: $chord, guesses: $guesses, guess: $guess, message: $message, guessType: $guessType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScaleStateImpl &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.chord, chord) || other.chord == chord) &&
            const DeepCollectionEquality().equals(other._guesses, _guesses) &&
            (identical(other.guess, guess) || other.guess == guess) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.guessType, guessType) ||
                other.guessType == guessType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scale, chord,
      const DeepCollectionEquality().hash(_guesses), guess, message, guessType);

  /// Create a copy of ScaleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScaleStateImplCopyWith<_$ScaleStateImpl> get copyWith =>
      __$$ScaleStateImplCopyWithImpl<_$ScaleStateImpl>(this, _$identity);
}

abstract class _ScaleState implements ScaleState {
  const factory _ScaleState(
      {final Scale<Note>? scale,
      final Chord<Note>? chord,
      final List<Note> guesses,
      final int guess,
      final String message,
      final GuessType guessType}) = _$ScaleStateImpl;

  @override
  Scale<Note>? get scale;
  @override
  Chord<Note>? get chord;
  @override
  List<Note> get guesses;
  @override
  int get guess;
  @override
  String get message;
  @override
  GuessType get guessType;

  /// Create a copy of ScaleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScaleStateImplCopyWith<_$ScaleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
