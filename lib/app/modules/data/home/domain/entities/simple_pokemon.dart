import 'dart:convert';

import 'package:equatable/equatable.dart';

class SimplePokemon extends Equatable {
  final String name;
  final String url;
  final int? id;

  const SimplePokemon({
    required this.name,
    required this.url,
    this.id,
  });

  SimplePokemon copyWith({
    String? name,
    String? url,
    int? id,
  }) {
    return SimplePokemon(
      name: name ?? this.name,
      url: url ?? this.url,
      id: id ?? this.id,
    );
  }

  factory SimplePokemon.fromMap(Map<String, dynamic> map) {
    return SimplePokemon(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SimplePokemon && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'id': id,
    };
  }

  @override
  List<Object> get props => [name, url];
}
