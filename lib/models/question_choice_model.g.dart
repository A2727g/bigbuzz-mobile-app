// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_choice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionChoiceModel _$QuestionChoiceModelFromJson(Map<String, dynamic> json) =>
    QuestionChoiceModel(
      choiceText: json['choice_text'] as String?,
      choiceValue: json['choice_value'],
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      isDeleted: json['is_deleted'] as int?,
      questionChoiceId: json['question_choices_id'] as int?,
      questionId: json['question_id'] as int?,
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'] as int?,
    );

Map<String, dynamic> _$QuestionChoiceModelToJson(
        QuestionChoiceModel instance) =>
    <String, dynamic>{
      'question_choices_id': instance.questionChoiceId,
      'question_id': instance.questionId,
      'choice_value': instance.choiceValue,
      'choice_text': instance.choiceText,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
    };
