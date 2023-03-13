import 'package:bigbuzz/models/question_choice_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'question_data_model.g.dart';

@JsonSerializable()
class QuestionDataModel {
  @JsonKey(name: 'question_id')
  final int? questionId;
  @JsonKey(name: 'questionnaire_id')
  final int? questionnaireId;
  @JsonKey(name: 'question')
  final String? question;
  @JsonKey(name: 'marks')
  final int? marks;
  @JsonKey(name: 'question_type')
  final String? questionType;
  @JsonKey(name: 'is_required')
  final int? isRequired;
  @JsonKey(name: 'sort_order')
  final int? sortOrder;
  @JsonKey(name: 'default_value')
  final String? defaultValue;
  @JsonKey(name: 'created_by')
  final int? createdBy;
  @JsonKey(name: 'updated_by')
  final int? updatedBy;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'is_deleted')
  final int? isDeleted;
  @JsonKey(name: 'question_choices')
  final List<QuestionChoiceModel>? questionChoices;

  QuestionDataModel({
    this.createdAt,
    this.createdBy,
    this.defaultValue,
    this.isDeleted,
    this.isRequired,
    this.marks,
    this.question,
    this.questionId,
    this.questionType,
    this.questionnaireId,
    this.sortOrder,
    this.updatedAt,
    this.updatedBy,
    this.questionChoices,
  });

  factory QuestionDataModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDataModelToJson(this);
}

                // "question_choices": [
                //     {
                //         "question_choices_id": 766,
                //         "question_id": 562,
                //         "choice_value": " [software",
                //         "choice_text": " [software",
                //         "created_by": null,
                //         "updated_by": null,
                //         "created_at": "0000-00-00 00:00:00",
                //         "updated_at": "0000-00-00 00:00:00",
                //         " is_deleted": 0
                //     }
               