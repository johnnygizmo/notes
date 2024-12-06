// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NumberStepImpl _$$NumberStepImplFromJson(Map<String, dynamic> json) =>
    _$NumberStepImpl(
      semitone: (json['semitone'] as num?)?.toInt(),
      interval: json['interval'] as String?,
      arabic: json['arabic'] as String?,
      roman: json['roman'] as String?,
      defaultTonality: json['defaultTonality'] as String?,
      accidental: json['accidental'] as String? ?? "",
    );

Map<String, dynamic> _$$NumberStepImplToJson(_$NumberStepImpl instance) =>
    <String, dynamic>{
      'semitone': instance.semitone,
      'interval': instance.interval,
      'arabic': instance.arabic,
      'roman': instance.roman,
      'defaultTonality': instance.defaultTonality,
      'accidental': instance.accidental,
    };
