import 'dart:convert';

class SimplePokemonDto {
  final String name;
  final String url;

  SimplePokemonDto({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory SimplePokemonDto.fromMap(Map<String, dynamic> map) {
    return SimplePokemonDto(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SimplePokemonDto.fromJson(String source) =>
      SimplePokemonDto.fromMap(json.decode(source));
}
