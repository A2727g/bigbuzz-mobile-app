import 'package:json_annotation/json_annotation.dart';

part 'get_auditor.g.dart';

@JsonSerializable()
class Auditor {
  /// The generated code assumes these values exist in JSON.
  final String auditor_name,
  auditor_phone,
  auditor_email,
  id_proof,
  adddress_proof,
  auditor_status,
  auditor_role,
  hash_password,
  auth_key,
  direct_company,
  gcm_key,
  otp,
  iphone_key,
  mobile_type,
  business_select_business_type,
  business_business_name,
  business_office_street_address,
  business_office_address_line,
  business_city,
  business_state,
  business_pincode,
  business_registration_date,
  buisness_are_you_msme,
  personal_full_name,
  personal_mobile_no,
  personal_alternate_mobile_no,
  personal_email_id,
  personal_permanent_address_is_same_as_above,
  personal_current_address,
  personal_current_address_city,
  personal_current_address_line,
  personal_current_address_state,
  personal_current_address_pincode,
  personal_current_address_country,
  pan_date_of_birth,
  pan_no,
  aadhaar_no,
  account_type,
  bank_account_no,
  bank_name,
  ifsc_code,
  total_team_members,
  select_the_states;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  // final DateTime? dateOfBirth;

  Auditor(this.auditor_name, this.auditor_phone, this.auditor_email, this.id_proof, this.adddress_proof, this.auditor_status, this.auditor_role, this.hash_password, this.auth_key, this.direct_company, this.gcm_key, this.otp, this.iphone_key, this.mobile_type, this.business_select_business_type, this.business_business_name, this.business_office_street_address, this.business_office_address_line, this.business_city, this.business_state, this.business_pincode, this.business_registration_date, this.buisness_are_you_msme, this.personal_full_name, this.personal_mobile_no, this.personal_alternate_mobile_no, this.personal_email_id, this.personal_permanent_address_is_same_as_above, this.personal_current_address, this.personal_current_address_city, this.personal_current_address_line, this.personal_current_address_state, this.personal_current_address_pincode, this.personal_current_address_country, this.pan_date_of_birth, this.pan_no, this.aadhaar_no, this.account_type, this.bank_account_no, this.bank_name, this.ifsc_code, this.total_team_members, this.select_the_states,);

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Auditor.fromJson(Map<String, dynamic> json) => _$AuditorFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AuditorToJson(this);
}