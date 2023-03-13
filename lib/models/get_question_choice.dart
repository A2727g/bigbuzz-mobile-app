import 'package:json_annotation/json_annotation.dart';

part 'get_question_choice.g.dart';

@JsonSerializable()
class QuestionChoice {
  /// The generated code assumes these values exist in JSON.
  final String  question_choices_id,
  question_id,
  choice_value,
  choice_text,
  mark_is_visible,
  created_by,
  updated_by,
  created_at,
  updated_at;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  // final DateTime? dateOfBirth;

  QuestionChoice(this.question_choices_id, this.question_id, this.choice_value, this.choice_text, this.mark_is_visible, this.created_by, this.updated_by, this.created_at, this.updated_at);

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory QuestionChoice.fromJson(Map<String, dynamic> json) => _$QuestionChoiceFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$QuestionChoiceToJson(this);
}