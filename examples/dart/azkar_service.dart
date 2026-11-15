import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// Model for an individual dhikr item.
class DhikrItem {
  final int id;
  final String text;
  final int count;
  final String? audio;
  final String? filename;

  DhikrItem({
    required this.id,
    required this.text,
    required this.count,
    this.audio,
    this.filename,
  });

  factory DhikrItem.fromJson(Map<String, dynamic> json) {
    return DhikrItem(
      id: json['id'] as int? ?? 0,
      text: json['text'] as String? ?? '',
      count: json['count'] is int ? json['count'] as int : int.tryParse(json['count']?.toString() ?? '1') ?? 1,
      audio: json['audio'] as String?,
      filename: json['filename'] as String?,
    );
  }
}

/// Model for a Hisn al-Muslim Azkar Category.
class AzkarCategory {
  final int id;
  final String category;
  final String audio;
  final String? filename;
  final List<DhikrItem> items;

  AzkarCategory({
    required this.id,
    required this.category,
    required this.audio,
    this.filename,
    required this.items,
  });

  factory AzkarCategory.fromJson(Map<String, dynamic> json) {
    final rawList = json['array'] as List<dynamic>? ?? [];
    return AzkarCategory(
      id: json['id'] as int? ?? 0,
      category: json['category'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
      filename: json['filename'] as String?,
      items: rawList.map((e) => DhikrItem.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

/// Service class for accessing Azkar categories and supplications.
class AzkarDataService {
  List<AzkarCategory>? _cachedCategories;

  Future<List<AzkarCategory>> loadAzkar({String assetPath = 'azkar/azkar.json'}) async {
    if (_cachedCategories != null) return _cachedCategories!;
    final jsonString = await rootBundle.loadString(assetPath);
    final List<dynamic> jsonList = jsonDecode(jsonString);
    _cachedCategories = jsonList.map((e) => AzkarCategory.fromJson(e as Map<String, dynamic>)).toList();
    return _cachedCategories!;
  }

  /// Search Azkar categories by keyword.
  Future<List<AzkarCategory>> searchCategories(String keyword) async {
    final list = await loadAzkar();
    return list.where((cat) => cat.category.contains(keyword.trim())).toList();
  }

  /// Get Morning Azkar (أذكار الصباح).
  Future<AzkarCategory?> getMorningAzkar() async {
    final list = await loadAzkar();
    return list.firstWhere(
      (cat) => cat.category.contains('أذكار الصباح'),
      orElse: () => list.first,
    );
  }

  /// Get Evening Azkar (أذكار المساء).
  Future<AzkarCategory?> getEveningAzkar() async {
    final list = await loadAzkar();
    return list.firstWhere(
      (cat) => cat.category.contains('أذكار المساء'),
      orElse: () => list.first,
    );
  }
}
