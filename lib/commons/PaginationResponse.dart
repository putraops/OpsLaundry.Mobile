class PaginationResponse {
  final int recordsTotal;
  final int recordsFiltered;
  final int draw;
  final dynamic error;
  final dynamic data;

  PaginationResponse({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.draw,
    required this.error,
    required this.data,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json) => _$ObjectFromJson(json);
}

PaginationResponse _$ObjectFromJson(Map<String, dynamic> json) => PaginationResponse(
  recordsTotal: json['recordsTotal'] as int,
  recordsFiltered: json['recordsFiltered'] as int,
  draw: json['draw'] as int,
  error: json['error'] as dynamic,
  data: json['data'] as dynamic,
);