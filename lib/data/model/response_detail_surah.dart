import 'dart:convert';

class DetailSurah {
  bool status;
  Request request;
  Info info;
  List<Data> data;

  DetailSurah({
    required this.status,
    required this.request,
    required this.info,
    required this.data,
  });

  DetailSurah copyWith({
    bool? status,
    Request? request,
    Info? info,
    List<Data>? data,
  }) =>
      DetailSurah(
        status: status ?? this.status,
        request: request ?? this.request,
        info: info ?? this.info,
        data: data ?? this.data,
      );

  factory DetailSurah.fromRawJson(String str) =>
      DetailSurah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailSurah.fromJson(Map<String, dynamic> json) => DetailSurah(
        status: json["status"],
        request: Request.fromJson(json["request"]),
        info: Info.fromJson(json["info"]),
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request": request.toJson(),
        "info": info.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  String arab;
  String asbab;
  String audio;
  String ayah;
  dynamic hizb;
  String id;
  String juz;
  String latin;
  dynamic notes;
  String page;
  String surah;
  String text;
  dynamic theme;

  Data({
    required this.arab,
    required this.asbab,
    required this.audio,
    required this.ayah,
    required this.hizb,
    required this.id,
    required this.juz,
    required this.latin,
    required this.notes,
    required this.page,
    required this.surah,
    required this.text,
    required this.theme,
  });

  Data copyWith({
    String? arab,
    String? asbab,
    String? audio,
    String? ayah,
    dynamic hizb,
    String? id,
    String? juz,
    String? latin,
    dynamic notes,
    String? page,
    String? surah,
    String? text,
    dynamic theme,
  }) =>
      Data(
        arab: arab ?? this.arab,
        asbab: asbab ?? this.asbab,
        audio: audio ?? this.audio,
        ayah: ayah ?? this.ayah,
        hizb: hizb ?? this.hizb,
        id: id ?? this.id,
        juz: juz ?? this.juz,
        latin: latin ?? this.latin,
        notes: notes ?? this.notes,
        page: page ?? this.page,
        surah: surah ?? this.surah,
        text: text ?? this.text,
        theme: theme ?? this.theme,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        arab: json["arab"],
        asbab: json["asbab"],
        audio: json["audio"],
        ayah: json["ayah"],
        hizb: json["hizb"],
        id: json["id"],
        juz: json["juz"],
        latin: json["latin"],
        notes: json["notes"],
        page: json["page"],
        surah: json["surah"],
        text: json["text"],
        theme: json["theme"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "asbab": asbab,
        "audio": audio,
        "ayah": ayah,
        "hizb": hizb,
        "id": id,
        "juz": juz,
        "latin": latin,
        "notes": notes,
        "page": page,
        "surah": surah,
        "text": text,
        "theme": theme,
      };
}

class Info {
  Surat surat;

  Info({
    required this.surat,
  });

  Info copyWith({
    Surat? surat,
  }) =>
      Info(
        surat: surat ?? this.surat,
      );

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        surat: Surat.fromJson(json["surat"]),
      );

  Map<String, dynamic> toJson() => {
        "surat": surat.toJson(),
      };
}

class Surat {
  int id;
  Nama nama;
  String relevasi;
  int ayatMax;

  Surat({
    required this.id,
    required this.nama,
    required this.relevasi,
    required this.ayatMax,
  });

  Surat copyWith({
    int? id,
    Nama? nama,
    String? relevasi,
    int? ayatMax,
  }) =>
      Surat(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        relevasi: relevasi ?? this.relevasi,
        ayatMax: ayatMax ?? this.ayatMax,
      );

  factory Surat.fromRawJson(String str) => Surat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Surat.fromJson(Map<String, dynamic> json) => Surat(
        id: json["id"],
        nama: Nama.fromJson(json["nama"]),
        relevasi: json["relevasi"],
        ayatMax: json["ayat_max"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama.toJson(),
        "relevasi": relevasi,
        "ayat_max": ayatMax,
      };
}

class Nama {
  String ar;
  String id;

  Nama({
    required this.ar,
    required this.id,
  });

  Nama copyWith({
    String? ar,
    String? id,
  }) =>
      Nama(
        ar: ar ?? this.ar,
        id: id ?? this.id,
      );

  factory Nama.fromRawJson(String str) => Nama.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Nama.fromJson(Map<String, dynamic> json) => Nama(
        ar: json["ar"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "id": id,
      };
}

class Request {
  String path;
  String surat;
  String ayat;
  String panjang;

  Request({
    required this.path,
    required this.surat,
    required this.ayat,
    required this.panjang,
  });

  Request copyWith({
    String? path,
    String? surat,
    String? ayat,
    String? panjang,
  }) =>
      Request(
        path: path ?? this.path,
        surat: surat ?? this.surat,
        ayat: ayat ?? this.ayat,
        panjang: panjang ?? this.panjang,
      );

  factory Request.fromRawJson(String str) => Request.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        path: json["path"],
        surat: json["surat"],
        ayat: json["ayat"],
        panjang: json["panjang"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "surat": surat,
        "ayat": ayat,
        "panjang": panjang,
      };
}
