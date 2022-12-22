import 'dart:convert';

import 'package:fluttergh/app/core/models/other.dart';

class Sprites {
  Sprites({
    required this.frontDefault,
    required this.other,
  });

  final String? frontDefault;
  final Other? other;

  Sprites copyWith({
    String? frontDefault,
    Other? other,
    Sprites? animated,
  }) {
    return Sprites(
      frontDefault: frontDefault ?? this.frontDefault,
      other: other ?? this.other,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'frontDefault': frontDefault,
      'other': other?.toMap(),
    };
  }

  factory Sprites.fromMap(Map<String, dynamic> map) {
    return Sprites(
      frontDefault: map['front_default'] ?? '',
      other: map['other'] != null ? Other.fromMap(map['other']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sprites.fromJson(String source) =>
      Sprites.fromMap(json.decode(source));

  @override
  String toString() => 'Sprites(frontDefault: $frontDefault, other: $other)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sprites && other.frontDefault == frontDefault;
  }

  @override
  int get hashCode => frontDefault.hashCode ^ other.hashCode;
}
