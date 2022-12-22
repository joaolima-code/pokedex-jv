abstract class EnvConfig {
  // ignore: constant_identifier_names
  static const String DEV = 'DEV';

  String get backendUrl;

  void initEnvConfig(String environment);
}
