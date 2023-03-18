class ErrorResponse {
  final String error;

  ErrorResponse({
    required this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ObjectFromJson(json);
}

ErrorResponse _$ObjectFromJson(Map<String, dynamic> json) => ErrorResponse(
  error: json['error'] as String,
);