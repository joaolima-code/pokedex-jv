import 'dart:convert';

class NameAndUrl {
  NameAndUrl({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  factory NameAndUrl.fromRawJson(String str) =>
      NameAndUrl.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NameAndUrl.fromJson(Map<String, dynamic> json) => NameAndUrl(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  NameAndUrl copyWith({
    String? name,
    String? url,
  }) {
    return NameAndUrl(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory NameAndUrl.fromMap(Map<String, dynamic> map) {
    return NameAndUrl(
      name: map['name'],
      url: map['url'],
    );
  }

  @override
  String toString() => 'NameAndUrl(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NameAndUrl && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
