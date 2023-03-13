import 'package:json_annotation/json_annotation.dart';
part 'get_campaign.g.dart';

@JsonSerializable()
class Campaign {
  /// The generated code assumes these values exist in JSON.
  final String
  campaign_id,
  campaign_title,
  campaign_description,
  auditor_fees,
  tl_fees,
  fos_fees,
  campaign_status,
  // start_date,
  // end_date,
  is_deleted,
  campaign_created_by,
  campaign_update_by,
  campaign_created_at,
  campaign_update_at;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime? start_date;
  final DateTime? end_date;

  Campaign(this.campaign_id,
      this.campaign_title,
      this.campaign_description,
      this.auditor_fees,
      this.tl_fees,
      this.fos_fees,
      this.campaign_status,
      this.is_deleted,
      this.campaign_created_by,
      this.campaign_update_by,
      this.campaign_created_at,
      this.campaign_update_at,
      this.start_date,
      this.end_date,);
  factory Campaign.fromJson(Map<String, dynamic> json) => _$CampaignFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CampaignToJson(this);
}
