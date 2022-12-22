import 'dart:convert';

import 'package:fluttergh/app/core/models/name_and_url.dart';

class Type {
  final int? slot;
  final NameAndUrl? type;

  Type({
    this.slot,
    this.type,
  });

  Type copyWith({
    int? slot,
    NameAndUrl? type,
  }) {
    return Type(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slot': slot,
      'type': type?.toMap(),
    };
  }

  factory Type.fromMap(Map<String, dynamic> map) {
    return Type(
      slot: map['slot']?.toInt(),
      type: map['type'] != null ? NameAndUrl.fromMap(map['type']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Type.fromJson(String source) => Type.fromMap(json.decode(source));

  @override
  String toString() => 'Type(slot: $slot, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Type && other.slot == slot && other.type == type;
  }

  @override
  int get hashCode => slot.hashCode ^ type.hashCode;
}
