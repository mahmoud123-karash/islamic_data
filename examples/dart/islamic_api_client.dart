import 'dart:convert';
import 'package:http/http.dart' as http;

/// Production-ready client showing how to call the primary Islamic APIs and endpoints.
class IslamicApiClient {
  final http.Client _client;

  IslamicApiClient({http.Client? client}) : _client = client ?? http.Client();

  // -------------------------------------------------------------
  // 1. Prayer Times & Calendar (AlAdhan API)
  // -------------------------------------------------------------
  static const String aladhanBaseUrl = 'https://api.aladhan.com/v1';

  /// Fetch monthly prayer times for coordinates.
  Future<List<dynamic>> getMonthlyPrayerTimes({
    required double latitude,
    required double longitude,
    required int year,
    required int month,
    int method = 5, // Egyptian General Authority of Survey
  }) async {
    final uri = Uri.parse(
      '$aladhanBaseUrl/calendar/$year/$month?latitude=$latitude&longitude=$longitude&method=$method',
    );
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return jsonBody['data'] as List<dynamic>? ?? [];
    }
    throw Exception('Failed to load prayer times: ${response.statusCode}');
  }

  /// Convert Gregorian date (DD-MM-YYYY) to Hijri.
  Future<Map<String, dynamic>> convertGregorianToHijri(String dateDdMmYyyy) async {
    final uri = Uri.parse('$aladhanBaseUrl/gToH/$dateDdMmYyyy');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'] as Map<String, dynamic>;
    }
    throw Exception('Failed to convert date: ${response.statusCode}');
  }

  // -------------------------------------------------------------
  // 2. Reciters & Audio (MP3Quran & Islamic Network CDN)
  // -------------------------------------------------------------
  static const String mp3QuranBaseUrl = 'https://www.mp3quran.net/api/v3';
  static const String islamicNetworkCdn = 'https://cdn.islamic.network';

  /// List all reciters from MP3Quran API.
  Future<List<dynamic>> getReciters({String language = 'ar'}) async {
    final uri = Uri.parse('$mp3QuranBaseUrl/reciters?language=$language');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['reciters'] as List<dynamic>? ?? [];
    }
    throw Exception('Failed to load reciters: ${response.statusCode}');
  }

  /// Direct CDN URL for an individual Ayah audio (verse index 1 - 6236).
  String getVerseAudioUrl(int verseNumber, {String reciter = 'ar.alafasy', int bitrate = 128}) {
    return '$islamicNetworkCdn/quran/audio/$bitrate/$reciter/$verseNumber.mp3';
  }

  /// Direct CDN URL for a complete Surah audio (surah number 1 - 114).
  String getSurahAudioUrl(int surahNumber, {String reciter = 'ar.alafasy', int bitrate = 128}) {
    return '$islamicNetworkCdn/quran/audio-surah/$bitrate/$reciter/$surahNumber.mp3';
  }

  // -------------------------------------------------------------
  // 3. Hadith Encyclopedia (HadeethEnc API)
  // -------------------------------------------------------------
  static const String hadeethEncBaseUrl = 'https://hadeethenc.com/api/v1';

  /// Get thematic Hadith categories.
  Future<List<dynamic>> getHadithCategories({String language = 'ar'}) async {
    final uri = Uri.parse('$hadeethEncBaseUrl/categories/list/?language=$language');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    }
    throw Exception('Failed to load hadith categories: ${response.statusCode}');
  }

  /// Get Hadiths belonging to a category.
  Future<List<dynamic>> getHadithsByCategory(String categoryId, {int count = 20, String language = 'ar'}) async {
    final uri = Uri.parse(
      '$hadeethEncBaseUrl/hadeeths/list/?language=$language&category_id=$categoryId&page=1&per_page=$count',
    );
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'] as List<dynamic>? ?? [];
    }
    throw Exception('Failed to load category hadiths: ${response.statusCode}');
  }

  /// Get complete Hadith details and explanation.
  Future<Map<String, dynamic>> getHadithDetails(String hadithId, {String language = 'ar'}) async {
    final uri = Uri.parse('$hadeethEncBaseUrl/hadeeths/one/?language=$language&id=$hadithId');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    throw Exception('Failed to load hadith details: ${response.statusCode}');
  }

  // -------------------------------------------------------------
  // 4. Canonical Hadith Books API (Fawaz Ahmed / jsDelivr)
  // -------------------------------------------------------------
  static const String fawazHadithCdn = 'https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1';

  /// Fetch complete book JSON (e.g. 'ara-bukhari', 'ara-muslim', 'ara-nawawi').
  Future<Map<String, dynamic>> getHadithBookEdition(String bookIdentifier) async {
    final uri = Uri.parse('$fawazHadithCdn/editions/$bookIdentifier.min.json');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    throw Exception('Failed to load hadith book: ${response.statusCode}');
  }

  // -------------------------------------------------------------
  // 5. Hisn al-Muslim Audio Streams
  // -------------------------------------------------------------
  static const String hisnMuslimAudioBaseUrl = 'http://www.hisnmuslim.com/audio/ar';

  /// Get audio stream URL for a Hisn al-Muslim chapter.
  String getHisnMuslimAudioUrl(int doorNumber) {
    final padded = doorNumber.toString().padLeft(3, '0');
    return '$hisnMuslimAudioBaseUrl/ar_7esn_AlMoslem_by_Doors_$padded.mp3';
  }

  // -------------------------------------------------------------
  // 6. Live Quran Radio Streams
  // -------------------------------------------------------------
  static const String radioCatalogUrl = 'https://data-rosy.vercel.app/radio.json';

  /// Fetch live radio catalog.
  Future<List<dynamic>> getRadioStations() async {
    final response = await _client.get(Uri.parse(radioCatalogUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['radios'] as List<dynamic>? ?? [];
    }
    throw Exception('Failed to load radio catalog: ${response.statusCode}');
  }

  void dispose() {
    _client.close();
  }
}
