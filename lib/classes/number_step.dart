import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_step.freezed.dart';
part 'number_step.g.dart';

@freezed
class NumberStep with _$NumberStep {

  factory NumberStep({
   int? semitone,
   String? interval,
   String? arabic,
   String? roman,
   String? defaultTonality,
   @Default("") String accidental,
  }) = _NumberStep;

  factory NumberStep.fromJson(Map<String, dynamic> json) => _$NumberStepFromJson(json);
}