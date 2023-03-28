part of 'DataTablesResponse.dart';

DataTablesResponse _$DataTablesResponseFromJson(Map<String, dynamic> json) => DataTablesResponse(
  recordsTotal: json['recordsTotal'] as int?,
  recordsFiltered: json['recordsFiltered'] as int?,
  draw: json['draw'] as int?,
  data: json['data'] as List<dynamic>?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$DataTablesResponseToJson(DataTablesResponse instance) => <String, dynamic>{
  'recordsTotal': instance.recordsTotal,
  'recordsFiltered': instance.recordsFiltered,
  'data': instance.data,
  'error': instance.error,
  'draw': instance.draw,
};