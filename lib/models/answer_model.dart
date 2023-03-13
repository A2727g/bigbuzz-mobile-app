import 'dart:io';

class AnswerModel {
  final int questionId;
  dynamic value;
  bool isFieldMandatory;
  bool isDataValidated;
  File? imageFile;

  AnswerModel(
      {required this.questionId,
      required this.value,
      required this.isFieldMandatory,
      required this.isDataValidated,
      this.imageFile});
}
