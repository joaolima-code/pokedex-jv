import 'dart:convert';

import 'package:fluttergh/app/core/models/name_and_url.dart';

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  final NameAndUrl? ability;
  final bool? isHidden;
  final int? slot;

  Ability copyWith({
    NameAndUrl? ability,
    bool? isHidden,
    int? slot,
  }) {
    return Ability(
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ability': ability?.toMap(),
      'isHidden': isHidden,
      'slot': slot,
    };
  }

  factory Ability.fromMap(Map<String, dynamic> map) {
    return Ability(
      ability:
          map['ability'] != null ? NameAndUrl.fromMap(map['ability']) : null,
      isHidden: map['is_hidden'],
      slot: map['slot']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ability.fromJson(String source) =>
      Ability.fromMap(json.decode(source));

  @override
  String toString() =>
      'Ability(ability: $ability, isHidden: $isHidden, slot: $slot)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ability &&
        other.ability == ability &&
        other.isHidden == isHidden &&
        other.slot == slot;
  }

  @override
  int get hashCode => ability.hashCode ^ isHidden.hashCode ^ slot.hashCode;
}
