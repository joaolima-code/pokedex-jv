import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fluttergh/app/core/models/name_and_url.dart';
import 'package:fluttergh/app/core/models/version_group.dart';

class Move {
  final NameAndUrl? move;
  final List<VersionGroupDetail>? versionGroupDetails;

  Move({
    this.move,
    this.versionGroupDetails,
  });

  Move copyWith({
    NameAndUrl? move,
    List<VersionGroupDetail>? versionGroupDetails,
  }) {
    return Move(
      move: move ?? this.move,
      versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'move': move?.toMap(),
      'versionGroupDetails':
          versionGroupDetails?.map((x) => x.toMap()).toList(),
    };
  }

  factory Move.fromMap(Map<String, dynamic> map) {
    return Move(
      move: map['move'] != null ? NameAndUrl.fromMap(map['move']) : null,
      versionGroupDetails: map['version_group_details'] != null
          ? List<VersionGroupDetail>.from(map['version_group_details']
              ?.map((x) => VersionGroupDetail.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Move.fromJson(String source) => Move.fromMap(json.decode(source));

  @override
  String toString() =>
      'Move(move: $move, versionGroupDetails: $versionGroupDetails)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Move &&
        other.move == move &&
        listEquals(other.versionGroupDetails, versionGroupDetails);
  }

  @override
  int get hashCode => move.hashCode ^ versionGroupDetails.hashCode;
}
