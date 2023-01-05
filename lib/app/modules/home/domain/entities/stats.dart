import 'package:equatable/equatable.dart';

class StatsPokemon extends Equatable {
  final int baseStat;
  final String statName;

  const StatsPokemon({
    required this.baseStat,
    required this.statName,
  });

  StatsPokemon copyWith({
    int? baseStat,
    String? statName,
  }) {
    return StatsPokemon(
      statName: statName ?? this.statName,
      baseStat: baseStat ?? this.baseStat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'statName': statName,
      'baseStat': baseStat,
    };
  }

  @override
  List<Object> get props {
    return [
      baseStat,
      statName,
    ];
  }
}
