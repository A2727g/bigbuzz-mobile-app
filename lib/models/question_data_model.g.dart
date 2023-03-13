// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDataModel _$QuestionDataModelFromJson(Map<String, dynamic> json) =>
    QuestionDataModel(
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as int?,
      defaultValue: json['default_value'] as String?,
      isDeleted: json['is_deleted'] as int?,
      isRequired: json['is_required'] as int?,
      marks: json['marks'] as int?,
      question: json['question'] as String?,
      questionId: json['question_id'] as int?,
      questionType: json['question_type'] as String?,
      questionnaireId: json['questionnaire_id'] as int?,
      sortOrder: json['sort_order'] as int?,
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'] as int?,
      questionChoices: (json['question_choices'] as List<dynamic>?)
          ?.map((e) => QuestionChoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionDataModelToJson(QuestionDataModel instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'questionnaire_id': instance.questionnaireId,
      'question': instance.question,
      'marks': instance.marks,
      'question_type': instance.questionType,
      'is_required': instance.isRequired,
      'sort_order': instance.sortOrder,
      'default_value': instance.defaultValue,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
      'question_choices': instance.questionChoices,
    };
