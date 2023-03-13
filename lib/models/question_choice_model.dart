import 'package:json_annotation/json_annotation.dart';
part 'question_choice_model.g.dart';

@JsonSerializable()
class QuestionChoiceModel {
  @JsonKey(name: "question_choices_id")
  final int? questionChoiceId;
  @JsonKey(name: "question_id")
  final int? questionId;
  @JsonKey(name: "choice_value")
  final dynamic choiceValue;
  @JsonKey(name: "choice_text")
  final String? choiceText;
  @JsonKey(name: "created_by")
  final String? createdBy;
  @JsonKey(name: "updated_by")
  final int? updatedBy;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'is_deleted')
  final int? isDeleted;

  QuestionChoiceModel({
    this.choiceText,
    this.choiceValue,
    this.createdAt,
    this.createdBy,
    this.isDeleted,
    this.questionChoiceId,
    this.questionId,
    this.updatedAt,
    this.updatedBy,
  });

  factory QuestionChoiceModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionChoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionChoiceModelToJson(this);
}
// "question_choices_id": 1,
//                         "question_id": 563,
//                         "choice_value": "Male",
//                         "choice_text": "Male",
//                         "created_by": null,
//                         "updated_by": null,
//                         "created_at": "2023-03-09T10:49:43.000Z",
//                         "updated_at": null,
//                         " is_deleted": 0