# 🕌 Islamic Data (`islamic_data`)

A clean, lightweight, and structured collection of open Islamic datasets, resources, APIs, and assets for mobile and web developers.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Pub.dev: quran_data_kit](https://img.shields.io/pub/v/quran_data_kit?color=blue&label=quran_data_kit&logo=dart)](https://pub.dev/packages/quran_data_kit)
[![Format: JSON / SQLite / TTF / SVG](https://img.shields.io/badge/Format-JSON%20%7C%20SQLite%20%7C%20TTF%20%7C%20SVG-blue.svg)](#-folder-structure)
[![Status: Production Ready](https://img.shields.io/badge/Status-Active-brightgreen.svg)](#-getting-started)

---

## 📖 What's Inside?

- **Flutter Package (`quran_data_kit`)**: Ready-to-use Flutter package on [pub.dev](https://pub.dev/packages/quran_data_kit) providing an authentic Mushaf page view, King Fahd QCF Tajweed font rendering & caching, 16 translations, audio streams, and Quran metadata.
- **Quran**: Complete Arabic text (6,236 Ayahs), 114 Surahs metadata, 30 Juzs, 240 Quarters, 604 pages layout, and 16 translations in clean JSON format.
- **Tafaseer**: 10 classical Tafseer books in unified JSON format (Al-Muyassar, Ibn Katheer, Al-Sa'dy, Al-Tabari, Al-Qurtubi, Al-Baghawi, etc.).
- **Hadith**: The 40 Hadiths of Imam An-Nawawi (with explanations) and 20 verified fabricated hadith alerts (JSON, CSV, SQLite).
- **Azkar & Duas**: 133 Hisn al-Muslim supplication categories and comprehensive Al-Ruqyah Al-Shar'iyyah.
- **Typography & Fonts**: 604 King Fahd Complex Tajweed page fonts (QCF v4), plus Cairo, Amiri, Tajawal, and Hafs fonts.
- **Icons & Graphics**: Clean, categorized SVG vectors for prayer times, Quran reading, Tasbeeh/dhikr, and Islamic symbols.
- **APIs Directory**: Ready-to-use directory and Dart client for AlAdhan, MP3Quran, HadeethEnc, and Islamic Network CDN.

---

## 📁 Folder Structure

```text
islamic_data/
├── quran/                             # Quranic datasets
│   ├── quran.json                     # Full Quran (6,236 Ayahs with Uthmanic & search text)
│   ├── surahs.json                    # 114 Surahs with revelation details & virtues
│   ├── juzs.json                      # 30 Juz divisions and verse coordinates
│   ├── quarters.json                  # 240 Rub el-Hizb quarters
│   ├── pages.json                     # 604 Madani Mushaf page layout definitions
│   ├── sajdah.json                    # 15 Tilawah prostration marks
│   └── translations/                  # 16 language translations (JSON)
│       ├── bengali.json               ├── malayalam.json
│       ├── chinese.json               ├── persian.json
│       ├── dutch.json                 ├── portuguese.json
│       ├── english.json (Saheeh)      ├── russian.json
│       ├── english_clear_quran.json   ├── spanish.json
│       ├── french.json                ├── swedish.json
│       ├── indonesian.json            ├── turkish.json
│       └── italian.json               └── urdu.json
│
├── hadith/                            # Prophetic traditions
│   ├── nawawi_forty.json              # 42 Nawawi Hadiths with full Sharh & audio/video links
│   ├── fake_hadith.json               # 20 fabricated hadiths with Dorar.net verdicts
│   ├── fake_hadith.csv                # Tabular spreadsheet format
│   └── fake_hadith.db                 # Embedded SQLite database
│
├── azkar/                             # Supplications & healing
│   ├── azkar.json                     # 133 Hisn al-Muslim categories with count & audio URLs
│   └── ruqyah.json                    # Al-Ruqyah Al-Shar'iyyah (principles, verses, hadiths)
│
├── assets/                            # Compatibility & Core Media (100% Backward Compatible)
│   ├── tafaseer/                      # 10 Complete Tafseer books (JSON format)
│   │   ├── ar_muyassar.json           ├── katheer.json           ├── tabary.json
│   │   ├── ar_ma3any.json             ├── qortoby.json           ├── tanweer.json
│   │   ├── sa3dy.json                 ├── baghawy.json           ├── waseet.json
│   │   └── e3rab.json
│   └── fonts/                         # Typography
│       ├── qcf_tajweed/               # 604 compressed QCF v4 Tajweed TTF fonts (Pages 1-604)
│       ├── cairo/                     # Google Cairo family (8 weights)
│       ├── amiri/                     # Amiri Regular Naskh
│       ├── tajawal/                   # Tajawal Regular UI font
│       ├── hafs/                      # Hafs V20 and HafsSmart 08
│       └── calligraphy/               # arsura.ttf (Surah titles) & QCF4_BSML.ttf (Basmallah)
│
├── multimedia/                        # Audio & reciter visuals
│   ├── radio.json                     # Live Quran radio station feeds
│   ├── reciters.json                  # Reciters directory with styles & server identifiers
│   ├── audio/                         # System sounds: prayer_adhan.mp3, done_sound.mp3, tally_sound.mp3
│   ├── images/
│   │   ├── surah_banner.png           # Traditional Islamic Surah title border
│   │   └── reciters/                  # 15 Reciter portrait photographs
│   └── animations/
│       └── play.json                  # Lottie audio visualizer
│
├── graphics/                          # Scalable SVG vectors
│   └── icons/
│       ├── prayer_times/              # Fajr, Sunrise, Dohar, Asr, Maghrib, Isha, Calendar
│       ├── quran/                     # Ayah, Open Quran, Book, Bookmark, Page, Sajdah
│       ├── dhikr/                     # Azkar, Counter, Rosary
│       ├── islamic/                   # Kaaba, Mosque, Qibla compass, Muhammed calligraphy
│       ├── colored/                   # 8 Vibrant multi-tone Islamic SVGs
│       └── ui/                        # Clean UI icons (Search, settings, sound, copy, share)
│
├── api/                               # Islamic APIs & Endpoints Directory
│   ├── README.md                      # Complete API reference, cURL commands & params
│   └── endpoints.json                 # Machine-readable schema of all 9 services
│
└── examples/                          # Ready-to-run developer code
    ├── dart/                          # Flutter/Dart services (Quran, Azkar, Hadith, API client)
    └── python/                        # Python quick exploration script
```

---

## 🚀 Getting Started

### 1. Clone or Download

```bash
git clone https://github.com/mahmoud123-karash/islamic_data.git
```

### 2. Direct CDN Usage (No Clone Needed)

You can load resources directly via GitHub Raw or GitHub Pages CDN:

- **Tafseer Books**:
  ```text
  https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/assets/tafaseer/ar_muyassar.json
  ```
- **QCF Tajweed Fonts (Page 1 to 604)**:
  ```text
  https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/assets/fonts/qcf_tajweed/QCF4001_COLOR-Regular.ttf.gz
  ```
- **Quran / Hadith / Azkar JSON**:
  ```text
  https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/quran/quran.json
  https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/hadith/nawawi_forty.json
  https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/azkar/azkar.json
  ```

---

## 💡 Quick Integration Examples

### Flutter / Dart

> 💡 **Flutter Package**: If you need a plug-and-play UI with authentic Mushaf page views (`QuranPageView`), King Fahd QCF Tajweed font rendering & caching, audio URLs, and translations, check out [**`quran_data_kit`**](https://pub.dev/packages/quran_data_kit) on pub.dev.

To load the raw datasets directly in your app, include the desired folders in your `pubspec.yaml`:

```yaml
flutter:
  assets:
    - quran/
    - azkar/
    - hadith/
    - assets/tafaseer/
```

Use the pre-built helpers in [`examples/dart/`](examples/dart/):

```dart
import 'package:your_app/examples/dart/quran_service.dart';
import 'package:your_app/examples/dart/islamic_api_client.dart';

void main() async {
  // 1. Search Quran verses using simplified search text
  final quranService = QuranDataService();
  final results = await quranService.searchVerses("الصبر");
  print("Found ${results.length} verses.");

  // 2. Fetch monthly prayer times from AlAdhan API
  final apiClient = IslamicApiClient();
  final prayerTimes = await apiClient.getMonthlyPrayerTimes(
    latitude: 30.0444,
    longitude: 31.2357,
    year: 2026,
    month: 11,
  );
  print("Loaded ${prayerTimes.length} days of prayer times.");
}
```

### Python

```python
import json

# Load Surahs metadata
with open("quran/surahs.json", "r", encoding="utf-8") as f:
    surahs = json.load(f)

for s in surahs[:3]:
    print(f"Surah {s['id']}: {s['arabic']} ({s['name']}) - {s['aya']} verses")
```

---

## 🌐 Integrated Islamic APIs

A summary of public Islamic APIs cataloged in [`api/endpoints.json`](api/endpoints.json) and documented in [`api/README.md`](api/README.md):

| Service | Purpose | Provider | Base URL |
| :--- | :--- | :--- | :--- |
| **Prayer Times** | Calculations & Monthly Calendar | AlAdhan | `https://api.aladhan.com/v1` |
| **Reciters** | Reciters list & Surah recitations | MP3Quran | `https://www.mp3quran.net/api/v3` |
| **Audio CDN** | Verse-by-verse & Surah MP3 streams | Islamic Network | `https://cdn.islamic.network` |
| **Hadith Encyclopedia** | Thematic hadith categories & Sharh | HadeethEnc | `https://hadeethenc.com/api/v1` |
| **Hadith Books** | Bukhari, Muslim, Abu Dawud, etc. | Fawaz Ahmed CDN | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1` |
| **99 Names** | Asma-ul-Husna with calligraphy | IslamicAPI | `https://islamicapi.com/api/v1` |
| **Azkar Audio** | Audio streams for Hisn al-Muslim | HisnMuslim | `http://www.hisnmuslim.com/audio/ar` |
| **Live Radios** | 24/7 Quran streaming stations | Data Rosy | `https://data-rosy.vercel.app` |

---

## 📄 License & Attribution

- **Code & Schemas**: Distributed under the permissive [MIT License](LICENSE).
- **Holy Quran Text**: In the public domain. Digital alignments from Tanzil Project & King Fahd Complex.
- **Fonts**:
  - Amiri: [SIL Open Font License 1.1](http://scripts.sil.org/OFL) (Khaled Hosny).
  - Cairo: [SIL Open Font License 1.1](http://scripts.sil.org/OFL) (Mohamed Gaber).
  - Tajawal: [SIL Open Font License 1.1](http://scripts.sil.org/OFL) (Bouchra Salhi).
  - QCF Tajweed Fonts: King Fahd Glorious Quran Printing Complex.
- **Tafaseer & Hadith**: Classical Islamic scholarly heritage in the public domain. Hadith verification references courtesy of Dorar.net.
