import 'package:json_annotation/json_annotation.dart';

part 'get_category.g.dart';

@JsonSerializable()
class Category {
  /// The generated code assumes these values exist in JSON.
  final String category_id,
  category_name,
  category_parent,
  is_deleted,
  category_created_by,
  category_update_by,
  category_created_at,
  category_updated_at;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  /// Connect the generated [_$PersonFromJson] function to the `fromJson`

  // final DateTime? dateOfBirth;

  Category(this.category_id, this.category_name, this.category_parent, this.is_deleted, this.category_created_by, this.category_update_by, this.category_created_at, this.category_updated_at);
  /// factory.
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}