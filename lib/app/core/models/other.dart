import 'dart:convert';

class Other {
  final DreamWorld? dreamWorld;

  Other({
    required this.dreamWorld,
  });

  Other copyWith({
    DreamWorld? dreamWorld,
  }) {
    return Other(
      dreamWorld: dreamWorld ?? this.dreamWorld,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dreamWorld': dreamWorld?.toMap(),
    };
  }

  factory Other.fromMap(Map<String, dynamic> map) {
    return Other(
      dreamWorld: DreamWorld.fromMap(map['dream_world']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Other.fromJson(String source) => Other.fromMap(json.decode(source));

  @override
  String toString() => 'Other(dreamWorld: $dreamWorld)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Other && other.dreamWorld == dreamWorld;
  }

  @override
  int get hashCode => dreamWorld.hashCode;
}

class DreamWorld {
  final String? frontDefault;

  DreamWorld({
    required this.frontDefault,
  });

  DreamWorld copyWith({
    String? frontDefault,
  }) {
    return DreamWorld(
      frontDefault: frontDefault ?? this.frontDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'frontDefault': frontDefault,
    };
  }

  factory DreamWorld.fromMap(Map<String, dynamic> map) {
    return DreamWorld(
      frontDefault: map['front_default'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DreamWorld.fromJson(String source) =>
      DreamWorld.fromMap(json.decode(source));

  @override
  String toString() => 'DreamWorld(frontDefault: $frontDefault)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DreamWorld && other.frontDefault == frontDefault;
  }

  @override
  int get hashCode => frontDefault.hashCode;
}
