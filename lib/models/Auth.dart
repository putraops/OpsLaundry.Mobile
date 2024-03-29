// ignore: file_names
class Auth {
  /// The generated code assumes these values exist in JSON.
  String? email, password;

  Auth({
    required this.email,
    required this.password,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  Map<String, dynamic> toJson() => _$ObjectToJson(this);

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    email: json['email'],
    password: json['password'],
  );
}

Map<String, dynamic> _$ObjectToJson(Auth instance) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
};
