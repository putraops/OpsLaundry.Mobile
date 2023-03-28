// ignore: file_names
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_apps/models/application_user.dart';

@JsonSerializable()
class InvokeUser {
  application_user? user;

  InvokeUser({
    this.user,
  });

  factory InvokeUser.fromJson(Map<String, dynamic> json) => _$InvokeUserFromJson(json);

  Map<String, dynamic> toJson() => _$InvokeUserToJson(this);
}

InvokeUser _$InvokeUserFromJson(Map<String, dynamic> json) => InvokeUser(
  user: json['user'] as application_user?,
);

Map<String, dynamic> _$InvokeUserToJson(InvokeUser instance) => <String, dynamic>{
  'user': instance.user,
};

