import 'dart:convert';

import 'package:fluttergh/app/core/models/name_and_url.dart';

class Stat {
  final int? baseStat;
  final int? effort;
  final NameAndUrl? stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  Stat copyWith({
    int? baseStat,
    int? effort,
    NameAndUrl? stat,
  }) {
    return Stat(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'baseStat': baseStat,
      'effort': effort,
      'stat': stat?.toMap(),
    };
  }

  factory Stat.fromMap(Map<String, dynamic> map) {
    return Stat(
      baseStat: map['base_stat']?.toInt(),
      effort: map['effort']?.toInt(),
      stat: map['stat'] != null ? NameAndUrl.fromMap(map['stat']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stat.fromJson(String source) => Stat.fromMap(json.decode(source));

  @override
  String toString() =>
      'Stat(baseStat: $baseStat, effort: $effort, stat: $stat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Stat &&
        other.baseStat == baseStat &&
        other.effort == effort &&
        other.stat == stat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}
