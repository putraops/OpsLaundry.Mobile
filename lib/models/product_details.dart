// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: camel_case_types
@JsonSerializable()
class product_details {
  String? id;
  bool? isActive = false;
  bool? isLocked = false;
  bool? isDefault = false;
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

  String? itemName;
  String? productId;
  String? productName;
  String? productDescription;
  String? productTypeId;
  String? productTypeName;
  String? serviceId;
  String? serviceName;
  String? uomId;
  String? uomName;
  String? uomCode;
  String? uomSymbol;

  String? recordCreated;
  String? recordUpdated;
  String? recordSubmitted;
  String? recordApproved;

  product_details({
    required this.id,
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

    this.itemName,
    this.productId,
    this.productName,
    this.productDescription,
    this.productTypeId,
    this.productTypeName,
    this.serviceId,
    this.serviceName,
    this.uomId,
    this.uomName,
    this.uomCode,
    this.uomSymbol,

    this.recordCreated,
    this.recordUpdated,
    this.recordSubmitted,
    this.recordApproved
  });

  product_details.fromJson(Map<String, dynamic> json) {
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

    itemName = json['item_name'];
    productId = json['product_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productTypeId = json['product_type_id'];
    productTypeName = json['product_type_name'];
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    uomId = json['uom_id'];
    uomName = json['uom_name'];
    uomCode = json['uom_code'];
    uomSymbol = json['uom_symbol'];

    recordCreated = json['record_created'];
    recordUpdated = json['record_updated'];
    recordSubmitted = json['record_submitted'];
    recordApproved = json['record_approved'];
  }

  Map<String, dynamic> toJson() => _$ObjectToJson(this);
}

Map<String, dynamic> _$ObjectToJson(product_details instance) => <String, dynamic>{
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

  'item_name' : instance.itemName,
  'product_id' : instance.productId,
  'product_name' : instance.productName,
  'product_description' : instance.productDescription,
  'product_type_id' : instance.productTypeId,
  'product_type_name' : instance.productTypeName,
  'service_id' : instance.serviceId,
  'service_name' : instance.serviceName,
  'uom_id' : instance.uomId,
  'uom_name' : instance.uomName,
  'uom_code' : instance.uomCode,
  'uom_symbol' : instance.uomSymbol,

  'record_created' : instance.recordCreated,
  'record_updated' : instance.recordUpdated,
  'record_submitted' : instance.recordSubmitted,
  'record_approved' : instance.recordApproved,
};