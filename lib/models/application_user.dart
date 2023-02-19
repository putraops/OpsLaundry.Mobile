// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: camel_case_types
@JsonSerializable()
class application_user {
  String? id;
  bool? isActive;
  bool? isLocked;
  bool? isDefault;
  String? ownerId;
  DateTime? createdAt;
  String? createdBy;
  DateTime? updatedAt;
  String? updatedBy;
  DateTime? submittedAt;
  String? submittedBy;
  DateTime? approvedAt;
  String? approvedBy;
  String? organizationId;
  String? tenantId;
  String? fbUid;
  String? firstName;
  String? lastName;
  String? username;
  String? title;
  String? address;
  String? phone;
  String? email;
  int? totalPoint;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  bool? isSuperAdmin;
  bool? isAdmin;
  int userType = 0;
  bool? gender;
  String? filepath;
  String? filepathThumbnail;
  String? filename;
  String? extension;
  String? size;
  String? description;
  String? token;
  String? organizationName;
  String? tenantName;
  String? fullname;
  String? initialName;
  bool? hasRole;
  String? recordCreated;
  String? recordUpdated;

  application_user({
    required this.id,
    this.isActive,
    this.isLocked,
    this.isDefault,
    this.ownerId,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.submittedAt,
    this.submittedBy,
    this.approvedAt,
    this.approvedBy,
    this.organizationId,
    this.tenantId,
    this.fbUid,
    this.firstName,
    this.lastName,
    this.username,
    this.title,
    this.address,
    this.phone,
    this.email,
    this.totalPoint,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.isSuperAdmin,
    this.isAdmin,
    this.userType = 0,
    this.gender,
    this.filepath,
    this.filepathThumbnail,
    this.filename,
    this.extension,
    this.size,
    this.description,
    this.token,
    this.organizationName,
    this.tenantName,
    this.fullname,
    this.initialName,
    this.hasRole,
    this.recordCreated,
    this.recordUpdated
  });

  application_user.fromJson(Map<String, dynamic> json) {
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
    tenantId = json['tenant_id'];
    fbUid = json['fb_uid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    title = json['title'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    totalPoint = json['total_point'];
    isEmailVerified = json['is_email_verified'];
    isPhoneVerified = json['is_phone_verified'];
    isSuperAdmin = json['is_super_admin'];
    isAdmin = json['is_admin'];
    userType = json['user_type'] ?? 0;
    gender = json['gender'];
    filepath = json['filepath'];
    filepathThumbnail = json['filepath_thumbnail'];
    filename = json['filename'];
    extension = json['extension'];
    size = json['size'];
    description = json['description'];
    token = json['token'];
    organizationName = json['organization_name'];
    tenantName = json['tenant_name'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    hasRole = json['has_role'];
    recordCreated = json['record_created'];
    recordUpdated = json['record_updated'];
  }

  Map<String, dynamic> toJson() => _$ObjectToJson(this);
}

Map<String, dynamic> _$ObjectToJson(application_user instance) => <String, dynamic>{
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
  'tenant_id' : instance.tenantId,
  'fb_uid' : instance.fbUid,
  'first_name' : instance.firstName,
  'last_name' : instance.lastName,
  'username' : instance.username,
  'title' : instance.title,
  'address' : instance.address,
  'phone' : instance.phone,
  'email' : instance.email,
  'total_point' : instance.totalPoint,
  'is_email_verified' : instance.isEmailVerified,
  'is_phone_verified' : instance.isPhoneVerified,
  'is_super_admin' : instance.isSuperAdmin,
  'is_admin' : instance.isAdmin,
  'user_type' : instance.userType,
  'gender' : instance.gender,
  'filepath' : instance.filepath,
  'filepath_thumbnail' : instance.filepathThumbnail,
  'filename' : instance.filename,
  'extension' : instance.extension,
  'size' : instance.size,
  'description' : instance.description,
  'token' : instance.token,
  'organization_name' : instance.organizationName,
  'tenant_name' : instance.tenantName,
  'fullname' : instance.fullname,
  'initial_name' : instance.initialName,
  'has_role' : instance.hasRole,
  'record_created' : instance.recordCreated,
  'record_updated' : instance.recordUpdated,
};


// static Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['id'] = id;
// data['is_active'] = isActive;
// data['is_locked'] = isLocked;
// data['is_default'] = isDefault;
// data['owner_id'] = ownerId;
// data['created_at'] = createdAt;
// data['created_by'] = createdBy;
// data['updated_at'] = updatedAt;
// data['updated_by'] = updatedBy;
// data['submitted_at'] = submittedAt;
// data['submitted_by'] = submittedBy;
// data['approved_at'] = approvedAt;
// data['approved_by'] = approvedBy;
// data['organization_id'] = organizationId;
// data['tenant_id'] = tenantId;
// data['fb_uid'] = fbUid;
// data['first_name'] = firstName;
// data['last_name'] = lastName;
// data['username'] = username;
// data['title'] = title;
// data['address'] = address;
// data['phone'] = phone;
// data['email'] = email;
// data['total_point'] = totalPoint;
// data['is_email_verified'] = isEmailVerified;
// data['is_phone_verified'] = isPhoneVerified;
// data['is_super_admin'] = isSuperAdmin;
// data['is_admin'] = isAdmin;
// data['user_type'] = userType;
// data['gender'] = gender;
// data['filepath'] = filepath;
// data['filepath_thumbnail'] = filepathThumbnail;
// data['filename'] = filename;
// data['extension'] = extension;
// data['size'] = size;
// data['description'] = description;
// data['token'] = token;
// data['organization_name'] = organizationName;
// data['tenant_name'] = tenantName;
// data['fullname'] = fullname;
// data['initial_name'] = initialName;
// data['has_role'] = hasRole;
// data['record_created'] = recordCreated;
// data['record_updated'] = recordUpdated;
// return data;
// }