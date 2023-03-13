// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnair_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionNairModel _$QuestionNairModelFromJson(Map<String, dynamic> json) =>
    QuestionNairModel(
      campaignId: json['campaign_id'] as int?,
      createdBy: json['created_by'] as int?,
      isDeleted: json['is_deleted'] as int?,
      questionnaireId: json['questionnaire_id'] as int?,
      status: json['status'] as int?,
      title: json['title'] as String?,
      updatedBy: json['updated_by'] as String?,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$QuestionNairModelToJson(QuestionNairModel instance) =>
    <String, dynamic>{
      'questionnaire_id': instance.questionnaireId,
      'campaign_id': instance.campaignId,
      'title': instance.title,
      'status': instance.status,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
      'questions': instance.questions,
    };
