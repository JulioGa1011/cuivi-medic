class Environment {
  // String clientId = "3";
  // String clientSecret = "w4TCSuGP3pnlfMUJCvL7sK9qGkaBtgkUPWTK16kX";
  // String baseUrl = "https://cuivi.app/";
  // String baseUrlApi = 'https://cuivi.app/api/';
  // String baseUrlStorage = 'https://cuivi.app/storage';
  String clientId = "3";
  String clientSecret = "O0g3pnoPZQX0dEJvMoUtJZwJLOeGveMmW4Q140LQ";
  String baseUrl = "https://cuivi.cceo.io/";
  String baseUrlApi = 'https://cuivi.cceo.io/api/';
  String baseUrlStorage = 'https://cuivi.app/storage';
  // String clientId = "3";
  // String clientSecret = "O0g3pnoPZQX0dEJvMoUtJZwJLOeGveMmW4Q140LQ";
  // String baseUrl =
  //     "http://6ee6-2806-103e-15-6023-e446-759b-3d4b-9780.ngrok.io/";
  // String baseUrlApi =
  //     'http://6ee6-2806-103e-15-6023-e446-759b-3d4b-9780.ngrok.io/api/';
  // String baseUrlStorage =
  //     'http://6ee6-2806-103e-15-6023-e446-759b-3d4b-9780.ngrok.io/storage';

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
