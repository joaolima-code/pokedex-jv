class StringHelper {
  StringHelper._();

  static String upperCasePrimary(String str) {
    final primary = str[0].toUpperCase();
    final resto = str.substring(1);

    return primary + resto;
  }

  static String normalizerId(int str) {
    if (str < 10) {
      final parse = str.toString();
      return 'N°00$parse';
    } else if (str < 100) {
      final parse = str.toString();
      return 'N°0$parse';
    }

    final parse = str.toString();

    return 'N°$parse';
  }
}
