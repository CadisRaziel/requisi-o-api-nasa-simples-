import 'dart:convert';

class Apod {
  String? date;
  String? explanation;
  String? url;
  String? title;
  String? copyright;
  Apod({
    this.date,
    this.explanation,
    this.url,
    this.title,
    this.copyright,
  });

  Apod copyWith({
    String? date,
    String? explanation,
    String? url,
    String? title,
    String? copyright,
  }) {
    return Apod(
      date: date ?? this.date,
      explanation: explanation ?? this.explanation,
      url: url ?? this.url,
      title: title ?? this.title,
      copyright: copyright ?? this.copyright,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'explanation': explanation,
      'url': url,
      'title': title,
      'copyright': copyright,
    };
  }

  factory Apod.fromMap(Map<String, dynamic> map) {
    return Apod(
      date: map['date'] ?? 'date',
      explanation: map['explanation'] ?? 'explanation',
      url: map['url'] ?? 'url',
      title: map['title'] ?? 'title',
      copyright: map['copyright'] ?? 'copyright',
    );
  }

  String toJson() => json.encode(toMap());

  factory Apod.fromJson(String source) => Apod.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Apod(date: $date, explanation: $explanation, url: $url, title: $title, copyright: $copyright)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Apod &&
        other.date == date &&
        other.explanation == explanation &&
        other.url == url &&
        other.title == title &&
        other.copyright == copyright;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        explanation.hashCode ^
        url.hashCode ^
        title.hashCode ^
        copyright.hashCode;
  }
}
