import 'dart:convert';

import 'package:fluttergh/app/core/models/name_and_url.dart';

class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  final int? levelLearnedAt;
  final NameAndUrl? moveLearnMethod;
  final NameAndUrl? versionGroup;

  VersionGroupDetail copyWith({
    int? levelLearnedAt,
    NameAndUrl? moveLearnMethod,
    NameAndUrl? versionGroup,
  }) {
    return VersionGroupDetail(
      levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
      moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
      versionGroup: versionGroup ?? this.versionGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'levelLearnedAt': levelLearnedAt,
      'moveLearnMethod': moveLearnMethod?.toMap(),
      'versionGroup': versionGroup?.toMap(),
    };
  }

  factory VersionGroupDetail.fromMap(Map<String, dynamic> map) {
    return VersionGroupDetail(
      levelLearnedAt: map['level_learned_at']?.toInt(),
      moveLearnMethod: map['move_learn_method'] != null
          ? NameAndUrl.fromMap(map['move_learn_method'])
          : null,
      versionGroup: map['version_group'] != null
          ? NameAndUrl.fromMap(map['version_group'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VersionGroupDetail.fromJson(String source) =>
      VersionGroupDetail.fromMap(json.decode(source));

  @override
  String toString() =>
      'VersionGroupDetail(levelLearnedAt: $levelLearnedAt, moveLearnMethod: $moveLearnMethod, versionGroup: $versionGroup)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VersionGroupDetail &&
        other.levelLearnedAt == levelLearnedAt &&
        other.moveLearnMethod == moveLearnMethod &&
        other.versionGroup == versionGroup;
  }

  @override
  int get hashCode =>
      levelLearnedAt.hashCode ^
      moveLearnMethod.hashCode ^
      versionGroup.hashCode;
}
