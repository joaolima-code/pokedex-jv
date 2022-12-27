import 'package:equatable/equatable.dart';

import 'package:fluttergh/app/modules/home/domain/entities/stats.dart';

class Pokemon extends Equatable {
  final String name;
  final int id;
  final String? imagem;
  final String? icon;
  final List<String> types;
  final int height;
  final int weight;
  final List<StatsPokemon> stats;

  const Pokemon({
    required this.name,
    required this.id,
    this.imagem,
    this.icon,
    required this.types,
    required this.height,
    required this.weight,
    required this.stats,
  });

  Pokemon copyWith({
    String? name,
    int? id,
    String? imagem,
    String? icon,
    List<String>? types,
    int? height,
    int? weight,
    List<StatsPokemon>? stats,
  }) {
    return Pokemon(
      name: name ?? this.name,
      id: id ?? this.id,
      imagem: imagem ?? this.imagem,
      icon: icon ?? this.icon,
      types: types ?? this.types,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      stats: stats ?? this.stats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'imagem': imagem,
      'icon': icon,
      'types': types,
      'height': height,
      'weight': weight,
      'stats': stats,
    };
  }

  @override
  List<Object> get props {
    return [
      name,
      id,
      types,
      height,
      weight,
      stats,
    ];
  }
}
