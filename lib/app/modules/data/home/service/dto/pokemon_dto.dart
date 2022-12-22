import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fluttergh/app/core/models/ability.dart';
import 'package:fluttergh/app/core/models/move.dart';
import 'package:fluttergh/app/core/models/sprites.dart';
import 'package:fluttergh/app/core/models/stat.dart';
import 'package:fluttergh/app/core/models/type.dart';

class PokemonDto {
  final List<Ability>? abilities;
  final int? baseExperience;
  final int? height;
  final int? id;
  final List<Move>? moves;
  final String? name;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<Type>? types;
  final int? weight;

  PokemonDto({
    this.abilities,
    this.baseExperience,
    required this.height,
    required this.id,
    this.moves,
    required this.name,
    required this.sprites,
    this.stats,
    required this.types,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'abilities': abilities?.map((x) => x.toMap()).toList(),
      'baseExperience': baseExperience,
      'height': height,
      'id': id,
      'moves': moves?.map((x) => x.toMap()).toList(),
      'name': name,
      'sprites': sprites?.toMap(),
      'stats': stats?.map((x) => x.toMap()).toList(),
      'types': types?.map((x) => x.toMap()).toList(),
      'weight': weight,
    };
  }

  factory PokemonDto.fromMap(Map<String, dynamic> map) {
    return PokemonDto(
      abilities: map['abilities'] != null
          ? List<Ability>.from(map['abilities']?.map((x) => Ability.fromMap(x)))
          : null,
      baseExperience: map['base_experience']?.toInt(),
      height: map['height']?.toInt(),
      id: map['id']?.toInt(),
      moves: map['moves'] != null
          ? List<Move>.from(map['moves']?.map((x) => Move.fromMap(x)))
          : null,
      name: map['name'],
      sprites: map['sprites'] != null ? Sprites.fromMap(map['sprites']) : null,
      stats: map['stats'] != null
          ? List<Stat>.from(map['stats']?.map((x) => Stat.fromMap(x)))
          : null,
      types: map['types'] != null
          ? List<Type>.from(map['types']?.map((x) => Type.fromMap(x)))
          : null,
      weight: map['weight']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonDto.fromJson(String source) =>
      PokemonDto.fromMap(json.decode(source));

  PokemonDto copyWith({
    List<Ability>? abilities,
    int? baseExperience,
    int? height,
    int? id,
    List<Move>? moves,
    String? name,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
  }) {
    return PokemonDto(
      abilities: abilities ?? this.abilities,
      baseExperience: baseExperience ?? this.baseExperience,
      height: height ?? this.height,
      id: id ?? this.id,
      moves: moves ?? this.moves,
      name: name ?? this.name,
      sprites: sprites ?? this.sprites,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      weight: weight ?? this.weight,
    );
  }

  @override
  String toString() {
    return 'PokemonDto(abilities: $abilities, baseExperience: $baseExperience, height: $height, id: $id, moves: $moves, name: $name, sprites: $sprites, stats: $stats, types: $types, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonDto &&
        listEquals(other.abilities, abilities) &&
        other.baseExperience == baseExperience &&
        other.height == height &&
        other.id == id &&
        listEquals(other.moves, moves) &&
        other.name == name &&
        other.sprites == sprites &&
        listEquals(other.stats, stats) &&
        listEquals(other.types, types) &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return abilities.hashCode ^
        baseExperience.hashCode ^
        height.hashCode ^
        id.hashCode ^
        moves.hashCode ^
        name.hashCode ^
        sprites.hashCode ^
        stats.hashCode ^
        types.hashCode ^
        weight.hashCode;
  }
}
