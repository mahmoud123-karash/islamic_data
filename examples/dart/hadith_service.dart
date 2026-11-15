import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// Model representing a Hadith from An-Nawawi's Forty.
class NawawiHadith {
  final int number;
  final String hadithLabel;
  final String title;
  final String hadith;
  final String isnad;
  final String narrator;
  final String explanation;
  final String audioUrl;
  final String videoUrl;
  final String url;

  NawawiHadith({
    required this.number,
    required this.hadithLabel,
    required this.title,
    required this.hadith,
    required this.isnad,
    required this.narrator,
    required this.explanation,
    required this.audioUrl,
    required this.videoUrl,
    required this.url,
  });

  factory NawawiHadith.fromJson(Map<String, dynamic> json) {
    return NawawiHadith(
      number: json['number'] as int? ?? 0,
      hadithLabel: json['hadith_label'] as String? ?? '',
      title: json['title'] as String? ?? '',
      hadith: json['hadith'] as String? ?? '',
      isnad: json['isnad'] as String? ?? '',
      narrator: json['narrator'] as String? ?? '',
      explanation: json['explanation'] as String? ?? '',
      audioUrl: json['audio_url'] as String? ?? '',
      videoUrl: json['video_url'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );
  }
}

/// Model representing a Fabricated / Weak Hadith entry.
class FabricatedHadith {
  final int id;
  final String hadithText;
  final String authenticityDegree;
  final String referenceUrl;

  FabricatedHadith({
    required this.id,
    required this.hadithText,
    required this.authenticityDegree,
    required this.referenceUrl,
  });

  factory FabricatedHadith.fromJson(Map<String, dynamic> json) {
    return FabricatedHadith(
      id: json['id'] as int? ?? 0,
      hadithText: json['hadith_text'] as String? ?? '',
      authenticityDegree: json['authenticity_degree'] as String? ?? '',
      referenceUrl: json['reference_url'] as String? ?? '',
    );
  }
}

/// Service class for Hadith collections.
class HadithDataService {
  List<NawawiHadith>? _cachedNawawi;
  List<FabricatedHadith>? _cachedFabricated;

  /// Load Forty Hadith of Imam An-Nawawi.
  Future<List<NawawiHadith>> loadNawawiForty({String assetPath = 'hadith/nawawi_forty.json'}) async {
    if (_cachedNawawi != null) return _cachedNawawi!;
    final jsonString = await rootBundle.loadString(assetPath);
    final List<dynamic> jsonList = jsonDecode(jsonString);
    _cachedNawawi = jsonList.map((e) => NawawiHadith.fromJson(e as Map<String, dynamic>)).toList();
    return _cachedNawawi!;
  }

  /// Load Fabricated / Unauthentic Hadith list.
  Future<List<FabricatedHadith>> loadFabricatedHadiths({String assetPath = 'hadith/fake_hadith.json'}) async {
    if (_cachedFabricated != null) return _cachedFabricated!;
    final jsonString = await rootBundle.loadString(assetPath);
    final List<dynamic> jsonList = jsonDecode(jsonString);
    _cachedFabricated = jsonList.map((e) => FabricatedHadith.fromJson(e as Map<String, dynamic>)).toList();
    return _cachedFabricated!;
  }

  /// Check if a query text matches any documented fabricated hadiths.
  Future<List<FabricatedHadith>> checkFabricatedHadith(String query) async {
    final list = await loadFabricatedHadiths();
    final clean = query.trim();
    return list.where((h) => h.hadithText.contains(clean)).toList();
  }
}
