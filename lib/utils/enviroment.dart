class Environment {
  // String clientId = "3";
  // String clientSecret = "w4TCSuGP3pnlfMUJCvL7sK9qGkaBtgkUPWTK16kX";
  // String baseUrl = "https://cuivi.app/";
  // String baseUrlApi = 'https://cuivi.app/api/';
  // String baseUrlStorage = 'https://cuivi.app/storage';
  String clientId = "3";
  String clientSecret = "e1mUTviUulN6rdkSR3sWdDrx04nACNVHMYn9ARyM";
  String baseUrl = "https://cuivi.cceo.io/";
  String baseUrlApi = 'https://cuivi.cceo.io/api/';
  String baseUrlStorage = 'https://cuivi.app/storage';

  // String clientSecret = "BuHirZW0b05qALe0gf1Vil4F4HRBTXO2vJA4OupI";
  // String baseUrl = "http://3ed6-2806-103e-15-59c3-ccd3-1155-bd3b-7f6b.ngrok.io/";
  // String baseUrlApi = 'http://3ed6-2806-103e-15-59c3-ccd3-1155-bd3b-7f6b.ngrok.io/api/';
  // String baseUrlStorage = 'https://cuivi.app/storage';

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
