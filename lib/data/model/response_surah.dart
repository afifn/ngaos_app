import 'dart:convert';

class Surah {
  bool status;
  Request request;
  List<Datum> data;

  Surah({
    required this.status,
    required this.request,
    required this.data,
  });

  factory Surah.fromRawJson(String str) => Surah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        status: json["status"],
        request: Request.fromJson(json["request"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request": request.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String audioUrl;
  String nameEn;
  String nameId;
  String nameLong;
  String nameShort;
  String number;
  String numberOfVerses;
  String revelation;
  String revelationEn;
  String revelationId;
  String sequence;
  String tafsir;
  String translationEn;
  String translationId;

  Datum({
    required this.audioUrl,
    required this.nameEn,
    required this.nameId,
    required this.nameLong,
    required this.nameShort,
    required this.number,
    required this.numberOfVerses,
    required this.revelation,
    required this.revelationEn,
    required this.revelationId,
    required this.sequence,
    required this.tafsir,
    required this.translationEn,
    required this.translationId,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        audioUrl: json["audio_url"],
        nameEn: json["name_en"],
        nameId: json["name_id"],
        nameLong: json["name_long"],
        nameShort: json["name_short"],
        number: json["number"],
        numberOfVerses: json["number_of_verses"],
        revelation: json["revelation"],
        revelationEn: json["revelation_en"],
        revelationId: json["revelation_id"],
        sequence: json["sequence"],
        tafsir: json["tafsir"],
        translationEn: json["translation_en"],
        translationId: json["translation_id"],
      );

  Map<String, dynamic> toJson() => {
        "audio_url": audioUrl,
        "name_en": nameEn,
        "name_id": nameId,
        "name_long": nameLong,
        "name_short": nameShort,
        "number": number,
        "number_of_verses": numberOfVerses,
        "revelation": revelation,
        "revelation_en": revelationEn,
        "revelation_id": revelationId,
        "sequence": sequence,
        "tafsir": tafsir,
        "translation_en": translationEn,
        "translation_id": translationId,
      };
}

class Request {
  String path;

  Request({
    required this.path,
  });

  factory Request.fromRawJson(String str) => Request.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
      };
}
