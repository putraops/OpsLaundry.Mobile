class StandardResult {
  final bool success;
  final String message;
  final dynamic data;

  StandardResult({
    required this.success,
    required this.message,
    required this.data,
  });

  factory StandardResult.fromJson(Map<String, dynamic> json) => _$ObjectFromJson(json);
}

StandardResult _$ObjectFromJson(Map<String, dynamic> json) => StandardResult(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: json['data'] as dynamic,
);