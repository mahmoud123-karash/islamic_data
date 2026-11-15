import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// Model representing a single Ayah in the Quran.
class Ayah {
  final int id;
  final int jozz;
  final int sora;
  final String soraNameEn;
  final String soraNameAr;
  final int page;
  final int lineStart;
  final int lineEnd;
  final int ayaNo;
  final String ayaText;
  final String ayaTextEmlaey;
  final String ayaTextOthmanic;
  final String qcfData;

  Ayah({
    required this.id,
    required this.jozz,
    required this.sora,
    required this.soraNameEn,
    required this.soraNameAr,
    required this.page,
    required this.lineStart,
    required this.lineEnd,
    required this.ayaNo,
    required this.ayaText,
    required this.ayaTextEmlaey,
    required this.ayaTextOthmanic,
    required this.qcfData,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      id: json['id'] as int,
      jozz: json['jozz'] as int,
      sora: json['sora'] as int,
      soraNameEn: json['sora_name_en'] as String? ?? '',
      soraNameAr: json['sora_name_ar'] as String? ?? '',
      page: json['page'] as int,
      lineStart: json['line_start'] as int,
      lineEnd: json['line_end'] as int,
      ayaNo: json['aya_no'] as int,
      ayaText: json['aya_text'] as String? ?? '',
      ayaTextEmlaey: json['aya_text_emlaey'] as String? ?? '',
      ayaTextOthmanic: json['aya_text_othmanic'] as String? ?? '',
      qcfData: json['qcfData'] as String? ?? '',
    );
  }
}

/// Model representing a Surah with metadata.
class SurahMetadata {
  final int id;
  final String name;
  final int aya;
  final String english;
  final String turkish;
  final String french;
  final String russian;
  final String place;
  final String arabic;
  final String surahInfo;
  final String surahInfoFromBook;
  final String surahNames;
  final String surahNamesFromBook;

  SurahMetadata({
    required this.id,
    required this.name,
    required this.aya,
    required this.english,
    required this.turkish,
    required this.french,
    required this.russian,
    required this.place,
    required this.arabic,
    required this.surahInfo,
    required this.surahInfoFromBook,
    required this.surahNames,
    required this.surahNamesFromBook,
  });

  factory SurahMetadata.fromJson(Map<String, dynamic> json) {
    return SurahMetadata(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      aya: json['aya'] as int,
      english: json['english'] as String? ?? '',
      turkish: json['turkish'] as String? ?? '',
      french: json['french'] as String? ?? '',
      russian: json['russian'] as String? ?? '',
      place: json['place'] as String? ?? '',
      arabic: json['arabic'] as String? ?? '',
      surahInfo: json['surahInfo'] as String? ?? '',
      surahInfoFromBook: json['surahInfoFromBook'] as String? ?? '',
      surahNames: json['surahNames'] as String? ?? '',
      surahNamesFromBook: json['surahNamesFromBook'] as String? ?? '',
    );
  }
}

/// Service class for accessing and searching Quran resources.
class QuranDataService {
  List<Ayah>? _cachedQuran;
  List<SurahMetadata>? _cachedSurahs;

  /// Load Quran dataset from assets or local filesystem.
  Future<List<Ayah>> loadQuran({String assetPath = 'quran/quran.json'}) async {
    if (_cachedQuran != null) return _cachedQuran!;
    final jsonString = await rootBundle.loadString(assetPath);
    final List<dynamic> jsonList = jsonDecode(jsonString);
    _cachedQuran = jsonList.map((e) => Ayah.fromJson(e as Map<String, dynamic>)).toList();
    return _cachedQuran!;
  }

  /// Load Surahs metadata.
  Future<List<SurahMetadata>> loadSurahs({String assetPath = 'quran/surahs.json'}) async {
    if (_cachedSurahs != null) return _cachedSurahs!;
    final jsonString = await rootBundle.loadString(assetPath);
    final List<dynamic> jsonList = jsonDecode(jsonString);
    _cachedSurahs = jsonList.map((e) => SurahMetadata.fromJson(e as Map<String, dynamic>)).toList();
    return _cachedSurahs!;
  }

  /// Search Quran verses using un-diacritized (Imla'i) text.
  Future<List<Ayah>> searchVerses(String query) async {
    final quran = await loadQuran();
    final cleanQuery = query.trim().toLowerCase();
    return quran.where((ayah) => ayah.ayaTextEmlaey.contains(cleanQuery)).toList();
  }

  /// Retrieve all verses belonging to a specific page (1 - 604).
  Future<List<Ayah>> getVersesByPage(int pageNumber) async {
    final quran = await loadQuran();
    return quran.where((ayah) => ayah.page == pageNumber).toList();
  }

  /// Retrieve all verses belonging to a specific Surah (1 - 114).
  Future<List<Ayah>> getVersesBySurah(int surahNumber) async {
    final quran = await loadQuran();
    return quran.where((ayah) => ayah.sora == surahNumber).toList();
  }
}
