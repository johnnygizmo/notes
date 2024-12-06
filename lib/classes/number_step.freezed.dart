// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NumberStep _$NumberStepFromJson(Map<String, dynamic> json) {
  return _NumberStep.fromJson(json);
}

/// @nodoc
mixin _$NumberStep {
  int? get semitone => throw _privateConstructorUsedError;
  String? get interval => throw _privateConstructorUsedError;
  String? get arabic => throw _privateConstructorUsedError;
  String? get roman => throw _privateConstructorUsedError;
  String? get defaultTonality => throw _privateConstructorUsedError;
  String get accidental => throw _privateConstructorUsedError;

  /// Serializes this NumberStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NumberStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberStepCopyWith<NumberStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberStepCopyWith<$Res> {
  factory $NumberStepCopyWith(
          NumberStep value, $Res Function(NumberStep) then) =
      _$NumberStepCopyWithImpl<$Res, NumberStep>;
  @useResult
  $Res call(
      {int? semitone,
      String? interval,
      String? arabic,
      String? roman,
      String? defaultTonality,
      String accidental});
}

/// @nodoc
class _$NumberStepCopyWithImpl<$Res, $Val extends NumberStep>
    implements $NumberStepCopyWith<$Res> {
  _$NumberStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? semitone = freezed,
    Object? interval = freezed,
    Object? arabic = freezed,
    Object? roman = freezed,
    Object? defaultTonality = freezed,
    Object? accidental = null,
  }) {
    return _then(_value.copyWith(
      semitone: freezed == semitone
          ? _value.semitone
          : semitone // ignore: cast_nullable_to_non_nullable
              as int?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      roman: freezed == roman
          ? _value.roman
          : roman // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultTonality: freezed == defaultTonality
          ? _value.defaultTonality
          : defaultTonality // ignore: cast_nullable_to_non_nullable
              as String?,
      accidental: null == accidental
          ? _value.accidental
          : accidental // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NumberStepImplCopyWith<$Res>
    implements $NumberStepCopyWith<$Res> {
  factory _$$NumberStepImplCopyWith(
          _$NumberStepImpl value, $Res Function(_$NumberStepImpl) then) =
      __$$NumberStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? semitone,
      String? interval,
      String? arabic,
      String? roman,
      String? defaultTonality,
      String accidental});
}

/// @nodoc
class __$$NumberStepImplCopyWithImpl<$Res>
    extends _$NumberStepCopyWithImpl<$Res, _$NumberStepImpl>
    implements _$$NumberStepImplCopyWith<$Res> {
  __$$NumberStepImplCopyWithImpl(
      _$NumberStepImpl _value, $Res Function(_$NumberStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumberStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? semitone = freezed,
    Object? interval = freezed,
    Object? arabic = freezed,
    Object? roman = freezed,
    Object? defaultTonality = freezed,
    Object? accidental = null,
  }) {
    return _then(_$NumberStepImpl(
      semitone: freezed == semitone
          ? _value.semitone
          : semitone // ignore: cast_nullable_to_non_nullable
              as int?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      roman: freezed == roman
          ? _value.roman
          : roman // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultTonality: freezed == defaultTonality
          ? _value.defaultTonality
          : defaultTonality // ignore: cast_nullable_to_non_nullable
              as String?,
      accidental: null == accidental
          ? _value.accidental
          : accidental // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NumberStepImpl implements _NumberStep {
  _$NumberStepImpl(
      {this.semitone,
      this.interval,
      this.arabic,
      this.roman,
      this.defaultTonality,
      this.accidental = ""});

  factory _$NumberStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$NumberStepImplFromJson(json);

  @override
  final int? semitone;
  @override
  final String? interval;
  @override
  final String? arabic;
  @override
  final String? roman;
  @override
  final String? defaultTonality;
  @override
  @JsonKey()
  final String accidental;

  @override
  String toString() {
    return 'NumberStep(semitone: $semitone, interval: $interval, arabic: $arabic, roman: $roman, defaultTonality: $defaultTonality, accidental: $accidental)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberStepImpl &&
            (identical(other.semitone, semitone) ||
                other.semitone == semitone) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.roman, roman) || other.roman == roman) &&
            (identical(other.defaultTonality, defaultTonality) ||
                other.defaultTonality == defaultTonality) &&
            (identical(other.accidental, accidental) ||
                other.accidental == accidental));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, semitone, interval, arabic,
      roman, defaultTonality, accidental);

  /// Create a copy of NumberStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberStepImplCopyWith<_$NumberStepImpl> get copyWith =>
      __$$NumberStepImplCopyWithImpl<_$NumberStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NumberStepImplToJson(
      this,
    );
  }
}

abstract class _NumberStep implements NumberStep {
  factory _NumberStep(
      {final int? semitone,
      final String? interval,
      final String? arabic,
      final String? roman,
      final String? defaultTonality,
      final String accidental}) = _$NumberStepImpl;

  factory _NumberStep.fromJson(Map<String, dynamic> json) =
      _$NumberStepImpl.fromJson;

  @override
  int? get semitone;
  @override
  String? get interval;
  @override
  String? get arabic;
  @override
  String? get roman;
  @override
  String? get defaultTonality;
  @override
  String get accidental;

  /// Create a copy of NumberStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberStepImplCopyWith<_$NumberStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
