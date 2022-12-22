class StringHelper {
  StringHelper._();

  static String upperCasePrimary(String str) {
    final primary = str[0].toUpperCase();
    final resto = str.substring(1);

    return primary + resto;
  }
}
