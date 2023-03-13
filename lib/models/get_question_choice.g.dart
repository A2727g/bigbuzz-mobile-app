// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_question_choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionChoice _$QuestionChoiceFromJson(Map<String, dynamic> json) =>
    QuestionChoice(
      json['question_choices_id'] as String,
      json['question_id'] as String,
      json['choice_value'] as String,
      json['choice_text'] as String,
      json['mark_is_visible'] as String,
      json['created_by'] as String,
      json['updated_by'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
    );

Map<String, dynamic> _$QuestionChoiceToJson(QuestionChoice instance) =>
    <String, dynamic>{
      'question_choices_id': instance.question_choices_id,
      'question_id': instance.question_id,
      'choice_value': instance.choice_value,
      'choice_text': instance.choice_text,
      'mark_is_visible': instance.mark_is_visible,
      'created_by': instance.created_by,
      'updated_by': instance.updated_by,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
