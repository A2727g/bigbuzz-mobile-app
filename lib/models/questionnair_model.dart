import 'package:bigbuzz/models/question_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'questionnair_model.g.dart';

@JsonSerializable()
class QuestionNairModel {
  @JsonKey(name: 'questionnaire_id')
  final int? questionnaireId;
  @JsonKey(name: 'campaign_id')
  final int? campaignId;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'created_by')
  final int? createdBy;
  @JsonKey(name: 'updated_by')
  final String? updatedBy;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'is_deleted')
  final int? isDeleted;
  @JsonKey(name: 'questions')
  List<QuestionDataModel> questions;

  QuestionNairModel({
    required this.campaignId,
    required this.createdBy,
    required this.isDeleted,
    required this.questionnaireId,
    required this.status,
    required this.title,
    required this.updatedBy,
    required this.questions,
    this.updatedAt,
    this.createdAt,
  });

  factory QuestionNairModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionNairModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionNairModelToJson(this);
}
