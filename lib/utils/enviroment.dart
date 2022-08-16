class Environment {
  // String clientId = "3";
  // String clientSecret = "w4TCSuGP3pnlfMUJCvL7sK9qGkaBtgkUPWTK16kX";
  // String baseUrl = "https://cuivi.app/";
  // String baseUrlApi = 'https://cuivi.app/api/';
  // String baseUrlStorage = 'https://cuivi.app/storage';
  String clientId = "3";
  String clientSecret = "w4TCSuGP3pnlfMUJCvL7sK9qGkaBtgkUPWTK16kX";
  String baseUrl = "https://cuivi.cceo.io/";
  String baseUrlApi = 'https://cuivi.cceo.io/api/';
  String baseUrlStorage = 'https://cuivi.app/storage';

  static Environment? _config = Environment._internal();
  factory Environment() {
    return _config!;
  }

  static Environment get config {
    _config ??= Environment._internal();
    return _config!;
  }

  Environment._internal();
}
