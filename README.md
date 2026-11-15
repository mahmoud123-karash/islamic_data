# 🕌 Islamic Data Repository (`islamic_data`)

A comprehensive, curated, developer-friendly repository of Islamic digital assets and structured datasets. Designed for mobile, web, and backend developers building modern Islamic applications (Quran apps, prayer timing utilities, Hadith collections, and Azkar trackers).

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Format: JSON / SQLite / TTF / SVG](https://img.shields.io/badge/Format-JSON%20%7C%20SQLite%20%7C%20TTF%20%7C%20SVG-blue.svg)](#contents-inventory)
[![Platform: Flutter / Android / iOS / Web](https://img.shields.io/badge/Platform-Flutter%20%7C%20React%20Native%20%7C%20Web-orange.svg)](#integration-examples)

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Folder Structure](#-folder-structure)
- [Contents Inventory](#-contents-inventory)
  - [1. Quran Data](#1-quran-data)
  - [2. Hadith Collections](#2-hadith-collections)
  - [3. Azkar & Ruqyah](#3-azkar--ruqyah)
  - [4. Tafaseer (10 Books)](#4-tafaseer-10-books)
  - [5. Typography & Fonts](#5-typography--fonts)
  - [6. Multimedia & Audio](#6-multimedia--audio)
  - [7. Vector Graphics & Icons](#7-vector-graphics--icons)
  - [8. APIs & Web Endpoints Directory](#8-apis--web-endpoints-directory)
- [Integration Examples](#-integration-examples)
  - [Flutter / Dart](#flutter--dart)
  - [Python](#python)
- [Versioning & Release Management](#-versioning--release-management)
- [Contributing](#-contributing)
- [Licensing & Attribution](#-licensing--attribution)

---

## 🌟 Overview

The **Islamic Data Repository** unifies all foundational Islamic resources into clean, standardized, and production-ready formats. Whether you are creating a full-featured Quran reader, an adhan/prayer reminder app, an authentic Hadith explorer, or a digital Tasbeeh counter, this repository provides:

- **Accuracy & Authenticity**: Standard Hafs text, King Fahd Complex alignments, and classical scholarly references.
- **Cross-Platform Compatibility**: Clean JSON datasets, SQLite databases, and scalable SVG vectors usable across Flutter, Android (Kotlin), iOS (Swift), React Native, Web, Python, and Go.
- **Backward Compatibility**: Fully preserves legacy paths (`assets/tafaseer/` and `assets/fonts/qcf_tajweed/`) to prevent breaking changes in existing consumer applications.
- **Complete API Directory**: Full documentation and machine-readable schema for all public Islamic REST APIs, streaming feeds, and CDNs.

---

## 📁 Folder Structure

```text
islamic_data/
├── README.md                          # Repository documentation & guide
├── LICENSE                            # MIT License & attribution details
├── CONTRIBUTING.md                     # Contribution guidelines
├── .gitignore                         # Git exclusion rules
│
├── api/                               # Islamic APIs & Endpoints Catalog
│   ├── README.md                      # Detailed API documentation, cURL requests & schemas
│   └── endpoints.json                 # Machine-readable catalog of all services & endpoints
│
├── quran/                             # Core Quranic datasets
│   ├── quran.json                     # Complete Quran (6,236 Ayahs with Uthmanic, simple, and QCF glyphs)
│   ├── surahs.json                    # 114 Surahs with metadata, revelation details, and virtues
│   ├── juzs.json                      # 30 Juz divisions and Surah/Ayah ranges
│   ├── quarters.json                  # 240 Rub el Hizb (quarters) mapping
│   ├── pages.json                     # 604 Madani Mushaf page layout definitions
│   ├── sajdah_verses.json             # 15 Quranic prostration marks
│   └── translations/                  # 16 complete language translations
│       ├── bengali.json
│       ├── chinese.json
│       ├── dutch_siregar.json
│       ├── english_clear_quran.json
│       ├── english_saheeh.json
│       ├── french_hamidullah.json
│       ├── indonesian.json
│       ├── italian_piccardo.json
│       ├── malayalam_abdulhameed.json
│       ├── persian_hussein_dari.json
│       ├── portuguese.json
│       ├── russian_kuliev.json
│       ├── spanish.json
│       ├── swedish.json
│       ├── turkish_saheeh.json
│       └── urdu.json
│
├── hadith/                            # Prophetic traditions & verification
│   ├── nawawi_forty.json              # 42 Hadiths of Imam An-Nawawi with text, isnad, and sharh
│   └── fake_hadiths/                  # Documented fabricated/unauthentic hadiths
│       ├── fake_hadith.json           # JSON format (20 entries with Dorar.net references)
│       ├── fake_hadith.csv            # Tabular CSV format
│       └── fake_hadith.db             # Original SQLite database
│
├── azkar/                             # Daily supplications & healing
│   ├── azkar.json                     # 133 Hisn al-Muslim categories with Arabic text and count
│   └── ruqyah.json                    # Al-Ruqyah Al-Shar'iyyah (rules, verses, authentic hadiths)
│
├── assets/                            # Compatibility & Core Media Assets
│   ├── tafaseer/                      # 10 Full Tafseer books (JSON format)
│   │   ├── ar_ma3any.json             # معاني القرآن الكريم
│   │   ├── ar_muyassar.json           # التفسير الميسر (مجمع الملك فهد)
│   │   ├── baghawy.json               # تفسير البغوي (معالم التنزيل)
│   │   ├── e3rab.json                 # إعراب القرآن وبيانه (لدعاس)
│   │   ├── katheer.json               # تفسير ابن كثير
│   │   ├── qortoby.json               # تفسير القرطبي (الجامع لأحكام القرآن)
│   │   ├── sa3dy.json                 # تفسير السعدي (تيسير الكريم الرحمن)
│   │   ├── tabary.json                # تفسير الطبري (جامع البيان)
│   │   ├── tanweer.json               # تفسير التحرير والتنوير (ابن عاشور)
│   │   └── waseet.json                # التفسير الوسيط (طنطاوي)
│   └── fonts/                         # Typography
│       ├── qcf_tajweed/               # 604 compressed QCF v4 Tajweed TTF fonts (QCF4001 - QCF4604)
│       ├── amiri/                     # Amiri Regular typeface
│       ├── cairo/                     # Cairo typeface family (8 font weights)
│       ├── hafs/                      # Hafs V20 and HafsSmart 08 fonts
│       ├── tajawal/                   # Tajawal Regular font
│       └── calligraphy/               # arsura.ttf (Surah titles) and QCF4_BSML.ttf (Basmallah)
│
├── multimedia/                        # Media & reciters
│   ├── radio.json                     # Islamic radio station streaming feeds
│   ├── reciters.json                  # Reciters directory with identifiers and stream styles
│   ├── images/                        # High-resolution visuals
│   │   ├── reciters/                  # 15 Reciter portrait photographs
│   │   ├── surah_banner.png           # Traditional Islamic Surah title border
│   │   ├── moshaf.jpeg
│   │   ├── prayer_times.jpeg
│   │   └── quran.png
│   ├── audio/                         # System audio alerts
│   │   ├── prayer_adhan.mp3           # Adhan call-to-prayer audio
│   │   ├── done_sound.mp3             # Task completion chime
│   │   └── tally_sound.mp3            # Digital Tasbeeh click sound
│   └── animations/
│       └── play.json                  # Lottie playback animation
│
├── graphics/                          # Optimized SVG vectors
│   └── icons/
│       ├── prayer_times/              # fajr, sunrise, dohar, asr, magrab, isha, calendar
│       ├── quran/                     # ayah, book, bookmark, open_quran, page, sajdah, translate
│       ├── dhikr/                     # azkar, counter, rosary
│       ├── islamic/                   # muhammed, names, mosque, kaapa, qibla, compass
│       ├── colored/                   # 8 vibrant multi-tone Islamic SVGs
│       └── general/                   # UI actions, sound controls, navigation
│
└── examples/                          # Ready-to-run implementation examples
    ├── dart/
    │   ├── quran_service.dart         # Flutter/Dart Quran models and search service
    │   ├── azkar_service.dart         # Azkar category parsing and daily supplication helpers
    │   ├── hadith_service.dart        # Forty Hadith and authenticity checker service
    │   └── islamic_api_client.dart    # Full API client for AlAdhan, MP3Quran, HadeethEnc, etc.
    └── python/
        └── explore_islamic_data.py    # Python script demonstrating parsing, querying & APIs
```

---

## 📦 Contents Inventory

### 1. Quran Data

| File | Description | Count | Format |
| :--- | :--- | :--- | :--- |
| `quran/quran.json` | Complete Holy Quran with Uthmanic text, simplified text (`aya_text_emlaey`), page, line, and QCF glyph data | 6,236 Ayahs | JSON |
| `quran/surahs.json` | Complete metadata for all 114 Surahs including English/Arabic names, classification, virtues, and names index | 114 Surahs | JSON |
| `quran/juzs.json` | Juz boundaries mapped with starting and ending Surah and Ayah coordinates | 30 Juzs | JSON |
| `quran/quarters.json`| Hizb quarter divisions (Rub el-Hizb) coordinates | 240 Quarters | JSON |
| `quran/pages.json` | Madani Mushaf page mapping with start and end verses per page | 604 Pages | JSON |
| `quran/sajdah_verses.json` | Verified locations of Tilawah prostrations | 15 Points | JSON |
| `quran/translations/*.json` | 16 language translations (Bengali, Chinese, Dutch, English, French, Indonesian, Italian, Malayalam, Persian, Portuguese, Russian, Spanish, Swedish, Turkish, Urdu) | 16 Languages | JSON |

#### `quran.json` Schema Example:
```json
{
  "id": 1,
  "jozz": 1,
  "sora": 1,
  "sora_name_en": "Al-Fātiḥah",
  "sora_name_ar": "الفَاتِحة",
  "page": 1,
  "line_start": 2,
  "line_end": 2,
  "aya_no": 1,
  "aya_text": "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ١\n",
  "aya_text_emlaey": "بسم الله الرحمن الرحيم",
  "aya_text_othmanic": "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏\n",
  "qcfData": "ﱁ ﱂﱃﱄﱅ\n"
}
```

---

### 2. Hadith Collections

- **An-Nawawi's Forty (`hadith/nawawi_forty.json`)**: Contains 42 fundamental hadiths with full diacritics, narrator biography, isnad, comprehensive explanation (*Sharh*), audio lecture URLs, and video URLs.
- **Fabricated Hadith Checker (`hadith/fake_hadiths/`)**: Contains 20 widely circulated unauthentic or fabricated narrations with their scholarly verdict (*Mawdoo'*, *Munkar*, *La Asla Lah*) and direct link to Dorar.net research. Provided in three formats:
  - `fake_hadith.json` for web and mobile apps.
  - `fake_hadith.csv` for data science and spreadsheets.
  - `fake_hadith.db` for native SQLite embedded queries.

---

### 3. Azkar & Ruqyah

- **Hisn al-Muslim (`azkar/azkar.json`)**: 133 categories containing morning and evening supplications, travel, prayer, sickness, and forgiveness prayers with repetition counters and audio recitation links.
- **Al-Ruqyah Al-Shar'iyyah (`azkar/ruqyah.json`)**: Structured guide covering theological prerequisites, step-by-step recitation guidelines, designated Quranic verses, authentic protective hadiths, and curated recitation audio URLs.

---

### 4. Tafaseer (10 Books)

The `assets/tafaseer/` directory contains 10 scholarly Quranic commentaries in unified JSON structure (`id`, `sura`, `aya`, `text`):
1. **التفسير الميسر** (`ar_muyassar.json`) - King Fahd Complex (2.9 MB)
2. **معاني القرآن** (`ar_ma3any.json`) (1.0 MB)
3. **تفسير السعدي** (`sa3dy.json`) (6.8 MB)
4. **تفسير البغوي** (`baghawy.json`) (8.3 MB)
5. **تفسير ابن كثير** (`katheer.json`) (16.1 MB)
6. **التفسير الوسيط لطنطاوي** (`waseet.json`) (19.6 MB)
7. **تفسير القرطبي** (`qortoby.json`) (20.5 MB)
8. **تفسير التحرير والتنوير** (`tanweer.json`) (29.0 MB)
9. **تفسير الطبري** (`tabary.json`) (36.1 MB)
10. **إعراب القرآن لدعاس** (`e3rab.json`) (5.6 MB)

---

### 5. Typography & Fonts

- **QCF v4 Tajweed (`assets/fonts/qcf_tajweed/`)**: 604 compressed TrueType font files (`.ttf.gz`) for page-by-page Tajweed color rendering according to King Fahd Complex standards.
- **Cairo Family (`assets/fonts/cairo/`)**: Complete Google Cairo family across 8 weights (Black, Bold, ExtraBold, ExtraLight, Light, Medium, Regular, SemiBold).
- **Amiri (`assets/fonts/amiri/Amiri-Regular.ttf`)**: Classical Arabic Naskh typeface.
- **Tajawal (`assets/fonts/tajawal/Tajawal-Regular.ttf`)**: Clean modern UI sans-serif.
- **Hafs & Calligraphy (`assets/fonts/hafs/` & `assets/fonts/calligraphy/`)**: Hafs V20, HafsSmart 08, Surah title calligraphy (`arsura.ttf`), and Basmallah glyph font (`QCF4_BSML.ttf`).

---

### 6. Multimedia & Audio

- **Reciters Directory (`multimedia/reciters.json`)**: Identifiers, Arabic/English names, and stream URLs for top reciters.
- **Reciter Portraits (`multimedia/images/reciters/`)**: High-quality photographs of 15 famous reciters.
- **Audio Alerts (`multimedia/audio/`)**: High fidelity audio for Adhan (`prayer_adhan.mp3`), completion chimes (`done_sound.mp3`), and Tasbeeh feedback (`tally_sound.mp3`).
- **Live Quran Radios (`multimedia/radio.json`)**: Streaming links for 24/7 Quran stations.

---

### 7. Vector Graphics & Icons

Over 70 optimized SVG vector icons categorised into:
- `prayer_times/`: Sun, moon, clock, and prayer time icons (Fajr, Sunrise, Dohar, Asr, Maghrib, Isha).
- `quran/`: Ayah end signs, open mushaf, bookmarks, translation glyphs.
- `dhikr/`: Digital counters, prayer beads, rosary icons.
- `islamic/`: Kaaba, Mosque, Qibla compass, Prophet Muhammad ﷺ calligraphy.
- `colored/`: 8 colored illustrative icons.
- `general/`: Standard UI elements (search, copy, share, download, settings, theme toggle).

---

### 8. APIs & Web Endpoints Directory

Complete documentation and machine-readable definitions are available in [`api/README.md`](api/README.md) and [`api/endpoints.json`](api/endpoints.json).

| Service | Category | Provider | Base URL |
| :--- | :--- | :--- | :--- |
| **Prayer Times & Hijri Calendar** | Calculation & Dates | AlAdhan | `https://api.aladhan.com/v1` |
| **Reciters & Chapter Audio** | Reciters Directory | MP3Quran.net | `https://www.mp3quran.net/api/v3` |
| **Verse & Surah Audio CDN** | Audio Streaming | Islamic Network | `https://cdn.islamic.network` |
| **Hadith Encyclopedia** | Thematic Hadith & Sharh | HadeethEnc | `https://hadeethenc.com/api/v1` |
| **Canonical Hadith Books API** | Bukhari, Muslim, etc. | Fawaz Ahmed / jsDelivr | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1` |
| **Asma-ul-Husna (99 Names)** | Divine Names API | IslamicAPI | `https://islamicapi.com/api/v1` |
| **Hisn al-Muslim Audio** | Supplication MP3s | HisnMuslim.com | `http://www.hisnmuslim.com/audio/ar` |
| **Live Quran Radios** | Streaming Radio Channels | Data Rosy / Vercel | `https://data-rosy.vercel.app` |
| **Tafaseer & Fonts CDN** | Cloud Storage & Mirrors | Islamic Data GitHub CDN | `https://mahmoud123-karash.github.io/islamic_data` |

---

## 💻 Integration Examples

### Flutter / Dart

Add the repository files to your `pubspec.yaml` or load them dynamically:

```yaml
flutter:
  assets:
    - quran/
    - azkar/
    - hadith/
    - assets/tafaseer/
```

Use the helper services provided in [`examples/dart/`](examples/dart/):

```dart
import 'package:your_app/examples/dart/quran_service.dart';
import 'package:your_app/examples/dart/islamic_api_client.dart';

void main() async {
  // 1. In-memory offline Quran search
  final quranService = QuranDataService();
  List<Ayah> verses = await quranService.searchVerses("الرحمة");
  print("Found ${verses.length} verses mentioning mercy.");

  // 2. Fetch monthly prayer times from API
  final apiClient = IslamicApiClient();
  final prayerData = await apiClient.getMonthlyPrayerTimes(
    latitude: 30.0444,
    longitude: 31.2357,
    year: 2026,
    month: 11,
  );
  print("Loaded prayer times for ${prayerData.length} days.");

  // 3. Get direct CDN audio stream for Verse 1 (Al-Fatihah)
  String audioUrl = apiClient.getVerseAudioUrl(1, reciter: 'ar.alafasy');
  print("Ayah Audio Stream: $audioUrl");
}
```

### Python

Run the exploration script located in [`examples/python/explore_islamic_data.py`](examples/python/explore_islamic_data.py):

```bash
python examples/python/explore_islamic_data.py
```

```python
import json

with open("quran/surahs.json", "r", encoding="utf-8") as f:
    surahs = json.load(f)

for s in surahs[:5]:
    print(f"Surah #{s['id']}: {s['name']} ({s['arabic']}) - {s['aya']} Ayahs")
```

---

## 🔄 Versioning & Release Management

This repository adheres to [Semantic Versioning (SemVer)](https://semver.org/):
- **MAJOR (`vX.0.0`)**: Breaking structure changes, column/key schema renames, or path shifts.
- **MINOR (`v1.X.0`)**: Adding new translations, tafaseer books, fonts, APIs, or icons without changing existing structures.
- **PATCH (`v1.0.X`)**: Corrections to typos in metadata, bug fixes in translation strings, or documentation improvements.

For production applications, it is recommended to pin commits or download assets to local storage/CDN to guarantee offline reliability.

---

## 🤝 Contributing

We welcome community contributions, additional translations, and data quality verifications. Please read our [CONTRIBUTING.md](CONTRIBUTING.md) for details on:
1. Submitting new authenticated Hadith or Tafseer datasets.
2. Reporting text issues or diacritic errors.
3. Submitting vector icons and design assets.
4. Adding or updating API endpoints.

---

## 📄 Licensing & Attribution

- **Source Code & Schemas**: Distributed under the [MIT License](LICENSE).
- **Holy Quran Text**: In the public domain. Digital alignments based on Tanzil Project and KFGQPC.
- **Fonts**:
  - Amiri: [SIL Open Font License 1.1](http://scripts.sil.org/OFL) (Khaled Hosny).
  - Cairo: [SIL Open Font License 1.1](http://scripts.sil.org/OFL) (Mohamed Gaber).
  - Tajawal: [SIL Open Font License 1.1](http://scripts.sil.org/OFL) (Bouchra Salhi).
  - QCF Tajweed Fonts: King Fahd Glorious Quran Printing Complex.
- **Tafaseer & Hadith**: Classical Islamic scholarly heritage in the public domain. Hadith verification references courtesy of Dorar.net.
- **APIs & Web Services**: Respective providers (AlAdhan, MP3Quran, HadeethEnc, Islamic Network, IslamicAPI, Fawaz Ahmed).
