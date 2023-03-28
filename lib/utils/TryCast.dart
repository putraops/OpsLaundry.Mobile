// ignore: file_names
class TryCast {
  static TryCast? _instance;
  factory TryCast() => _instance ??= TryCast._();
  TryCast._();

  T? toObject<T>(dynamic value, {T? fallback}) {
    try {
      return (value as T);
    } on TypeError catch (e) {
      print('CastError when trying to cast $value to $T!');
      return fallback;
    }
  }
}