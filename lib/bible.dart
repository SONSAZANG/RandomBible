import 'dart:convert';

List<Bible> bibleFromJson(String str) =>
    List<Bible>.from(json.decode(str).map((x) => Bible.fromJson(x)));

String bibleToJson(List<Bible> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bible {
  Bible({
    required this.bibles,
  });

  List<BibleElement> bibles;

  factory Bible.fromJson(Map<String, dynamic> json) => Bible(
        bibles: List<BibleElement>.from(
            json["bibles"].map((x) => BibleElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bibles": List<dynamic>.from(bibles.map((x) => x.toJson())),
      };
}

class BibleElement {
  BibleElement({
    required this.verseid,
    required this.verse,
  });

  String verseid;
  String verse;

  factory BibleElement.fromJson(Map<String, dynamic> json) => BibleElement(
        verseid: json["verseid"],
        verse: json["verse"],
      );

  Map<String, dynamic> toJson() => {
        "verseid": verseid,
        "verse": verse,
      };
}
