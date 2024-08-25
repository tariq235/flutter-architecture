class Environment {
  final String apiUrl;
  final bool isProduction;

  Environment._({required this.apiUrl, required this.isProduction});

  static final dev = Environment._(
    apiUrl: 'https://dev.api.example.com',
    isProduction: false,
  );

  static final prod = Environment._(
    apiUrl: 'https://api.example.com',
    isProduction: true,
  );
}
