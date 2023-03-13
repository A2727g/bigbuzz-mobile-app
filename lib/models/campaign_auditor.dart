import 'package:json_annotation/json_annotation.dart';

part 'campaign_auditor.g.dart';

@JsonSerializable()
class CampaignAuditor {
  /// The generated code assumes these values exist in JSON.
  final String  campaign_auditor_id,
  campaign_id,
  client_id,
  auditor_id,
  created_by,
  updated_by,
  created_at,
  updated_at,
  campaign_title,
  campaign_description,
  auditor_fees,
  tl_fees,
  fos_fees,
  campaign_status,
  // start_dat,
  // end_date,
  is_deleted,
  campaign_created_by,
  campaign_update_by,
  campaign_created_at,
  campaign_update_at;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime?
  start_date,
  end_date;

  CampaignAuditor(this.campaign_auditor_id, this.campaign_id, this.client_id, this.auditor_id, this.created_by, this.updated_by, this.created_at, this.updated_at, this.campaign_title, this.campaign_description, this.auditor_fees, this.tl_fees, this.fos_fees, this.campaign_status, this.is_deleted, this.campaign_created_by, this.campaign_update_by, this.campaign_created_at, this.campaign_update_at, this.start_date, this.end_date);

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory CampaignAuditor.fromJson(Map<String, dynamic> json) => _$CampaignAuditorFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CampaignAuditorToJson(this);
}