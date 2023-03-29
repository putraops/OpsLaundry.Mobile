import 'package:json_annotation/json_annotation.dart';

class FilterObject {
  String? key;
  String? value;
  String? displayName;

  FilterObject({this.key, this.value, this.displayName});

  FilterObject.fromJson(Map<String, dynamic> json) {
    key = json['column'];
    value = json['direction'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['column'] = key;
    data['value'] = value;
    data['displayName'] = displayName;
    return data;
  }
}