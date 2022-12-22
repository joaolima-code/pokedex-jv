import 'dart:convert';

import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;
  final int id;
  final String? imagem;
  final String? icon;
  final List<String> types;
  final int height;
  final int weight;

  const Pokemon({
    required this.name,
    required this.id,
    this.imagem,
    this.icon,
    required this.types,
    required this.height,
    required this.weight,
  });

  Pokemon copyWith({
    String? name,
    int? id,
    String? imagem,
    String? icon,
    List<String>? types,
    int? height,
    int? weight,
  }) {
    return Pokemon(
      name: name ?? this.name,
      id: id ?? this.id,
      imagem: imagem ?? this.imagem,
      icon: icon ?? this.icon,
      types: types ?? this.types,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      imagem: map['imagem'] ?? '',
      icon: map['icon'] ?? '',
      types: List<String>.from(map['types']),
      height: map['height']?.toInt() ?? 0,
      weight: map['weight']?.toInt() ?? 0,
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
    ];
  }
}
