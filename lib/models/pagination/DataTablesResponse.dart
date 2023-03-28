import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class DataTablesResponse {
  int? recordsTotal;
  int? recordsFiltered;
  int? draw;
  List<dynamic>? data;
  String? error;

  DataTablesResponse({
    this.recordsTotal = 0,
    this.recordsFiltered = 0,
    this.draw = 0,
    this.data,
    this.error
  });

  factory DataTablesResponse.fromJson(Map<String, dynamic> json) => _$DataTablesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataTablesResponseToJson(this);
}