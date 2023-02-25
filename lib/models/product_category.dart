// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: camel_case_types
@JsonSerializable()
class product_category {
  String? id;
  bool? isActive = false;
  bool? isLocked;
  bool? isDefault;
  String? ownerId;
  DateTime? createdAt;
  String? createdBy;
  DateTime? updatedAt;
  String? updatedBy;
  DateTime? approvedAt;
  String? approvedBy;
  DateTime? submittedAt;
  String? submittedBy;
  String? organizationId;
  String? organizationName;

  String? name;
  String? description;

  String? recordCreated;
  String? recordUpdated;
  String? recordSubmitted;
  String? recordApproved;

  product_category({
    this.id,
    this.isActive,
    this.isLocked,
    this.isDefault,
    this.ownerId,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.approvedAt,
    this.approvedBy,
    this.submittedAt,
    this.submittedBy,
    this.organizationId,
    this.organizationName,

    this.name,
    this.description,

    this.recordCreated,
    this.recordUpdated,
    this.recordSubmitted,
    this.recordApproved
  });

  product_category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
    isLocked = json['is_locked'];
    isDefault = json['is_default'];
    ownerId = json['owner_id'];
    createdAt = json['submitted_at'] == null ? null : DateTime.tryParse(json['created_at']);
    createdBy = json['created_by'];
    updatedAt = json['submitted_at'] == null ? null : DateTime.tryParse(json['updated_at']);
    updatedBy = json['updated_by'];
    submittedAt = json['submitted_at'] == null ? null : DateTime.tryParse(json['submitted_at']);
    submittedBy = json['submitted_by'];
    approvedAt = json['submitted_at'] == null ? null : DateTime.tryParse(json['approved_at']);
    approvedBy = json['approved_by'];
    organizationId = json['organization_id'];
    organizationName = json['organization_name'];

    name = json['name'];
    description = json['description'];

    recordCreated = json['record_created'];
    recordUpdated = json['record_updated'];
    recordSubmitted = json['record_submitted'];
    recordApproved = json['record_approved'];
  }

  Map<String, dynamic> toJson() => _$ObjectToJson(this);
}

Map<String, dynamic> _$ObjectToJson(product_category instance) => <String, dynamic>{
  'id' : instance.id,
  'is_active' : instance.isActive,
  'is_locked' : instance.isLocked,
  'is_default' : instance.isDefault,
  'owner_id' : instance.ownerId,
  'created_at' : instance.createdAt,
  'created_by' : instance.createdBy,
  'updated_at' : instance.updatedAt,
  'updated_by' : instance.updatedBy,
  'submitted_at' : instance.submittedAt,
  'submitted_by' : instance.submittedBy,
  'approved_at' : instance.approvedAt,
  'approved_by' : instance.approvedBy,
  'organization_id' : instance.organizationId,
  'organization_name' : instance.organizationName,

  'name' : instance.name,
  'description' : instance.description,

  'record_created' : instance.recordCreated,
  'record_updated' : instance.recordUpdated,
  'record_submitted' : instance.recordSubmitted,
  'record_approved' : instance.recordApproved,
};