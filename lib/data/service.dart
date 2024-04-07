import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngaos_app/data/model/response_detail_surah.dart';
import 'package:ngaos_app/data/model/response_surah.dart';

class Service {
  final baseUrl = "https://api.myquran.com/v2/";
  final client = http.Client();

  Future<List<Datum>> getListSurah() async {
    try {
      var response = await client.get(Uri.parse("${baseUrl}quran/surat/semua"));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        Surah surah = Surah.fromJson(json);
        return surah.data;
      } else {
        throw Exception("failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Data>> getDetailSurah(int surah, int ayat, int panjang) async {
    try {
      int offset = (ayat - 1) ~/ 30 * 30;
      print(offset);
      var response =
          await client.get(Uri.parse("${baseUrl}quran/ayat/$surah/$offset/30"));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        print(json);
        DetailSurah surah = DetailSurah.fromJson(json);
        return surah.data;
      } else {
        throw Exception("failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
