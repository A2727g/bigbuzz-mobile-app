// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      json['campaign_id'] as String,
      json['campaign_title'] as String,
      json['campaign_description'] as String,
      json['auditor_fees'] as String,
      json['tl_fees'] as String,
      json['fos_fees'] as String,
      json['campaign_status'] as String,
      json['start_date'] as String,
      json['end_date'] as String,
      json['is_deleted'] as String,
      json['campaign_created_by'] as String,
      json['campaign_update_by'] as String,
      json['campaign_created_at'] as String,
      json['campaign_update_at'] as String,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'campaign_id': instance.campaign_id,
      'campaign_title': instance.campaign_title,
      'campaign_description': instance.campaign_description,
      'auditor_fees': instance.auditor_fees,
      'tl_fees': instance.tl_fees,
      'fos_fees': instance.fos_fees,
      'campaign_status': instance.campaign_status,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'is_deleted': instance.is_deleted,
      'campaign_created_by': instance.campaign_created_by,
      'campaign_update_by': instance.campaign_update_by,
      'campaign_created_at': instance.campaign_created_at,
      'campaign_update_at': instance.campaign_update_at,
    };
