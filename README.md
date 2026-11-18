# 🕌 Islamic Data

A clean, lightweight, and structured collection of open Islamic datasets, resources, APIs, and assets for mobile and web developers.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Pub.dev: quran_data_kit](https://img.shields.io/pub/v/quran_data_kit?color=blue&label=quran_data_kit&logo=dart)](https://pub.dev/packages/quran_data_kit)
[![Format: JSON / SQLite / TTF / SVG](https://img.shields.io/badge/Format-JSON%20%7C%20SQLite%20%7C%20TTF%20%7C%20SVG-blue.svg)](#-folder-structure)
[![Status: Production Ready](https://img.shields.io/badge/Status-Active-brightgreen.svg)](#-getting-started)

---

## 📖 What's Inside?

- **Flutter Package (`quran_data_kit`)**: Ready-to-use Flutter package on [pub.dev](https://pub.dev/packages/quran_data_kit) providing an authentic Mushaf page view, King Fahd QCF Tajweed font rendering & caching, 16 translations, audio streams, and Quran metadata.
- **Quran**: Complete Arabic text (6,236 Ayahs), 114 Surahs metadata, 114 individual Surah JSON files, 30 Juzs, 240 Quarters, 604 pages layout, 16 translations, and 604 Madani Mushaf page image scans across 4 resolutions & styles.
- **Tafaseer**: 10 classical Tafseer books in unified JSON format (Al-Muyassar, Ibn Katheer, Al-Sa'dy, Al-Tabari, Al-Qurtubi, Al-Baghawi, etc.).
- **Hadith**: Complete 9 Major Hadith Collections (_Kutub al-Tis'ah_: Bukhari, Muslim, Abu Dawood, Tirmidhi, Nasa'i, Ibn Majah, Malik, Ahmad, Darimi), the 40 Hadiths of Imam An-Nawawi (with explanations), and 20 verified fabricated hadith alerts (JSON, CSV, SQLite).
- **Azkar & Duas**: 133 Hisn al-Muslim supplication categories and comprehensive Al-Ruqyah Al-Shar'iyyah.
- **Typography & Fonts**: 604 King Fahd Complex Tajweed page fonts (QCF v4), plus Cairo, Amiri, Tajawal, Diodrum Arabic (4 weights), and Hafs & Uthmanic Hafs (Regular & Bold) fonts.
- **Icons & Graphics**: Clean, categorized SVG vectors for prayer times, Quran reading, Tasbeeh/dhikr, and Islamic symbols.
- **APIs Directory**: Ready-to-use reference catalog and schema for AlAdhan, MP3Quran, HadeethEnc, and Islamic Network CDN.

---

## 📁 Folder Structure

```text
islamic_data/
├── quran/                             # Quranic datasets & imagery
│   ├── quran.json                     # Full Quran (6,236 Ayahs with Uthmanic & search text)
│   ├── surahs.json                    # 114 Surahs with revelation details & virtues
│   ├── juzs.json                      # 30 Juz divisions and verse coordinates
│   ├── quarters.json                  # 240 Rub el-Hizb quarters
│   ├── pages.json                     # 604 Madani Mushaf page layout definitions
│   ├── sajdah.json                    # 15 Tilawah prostration marks
│   ├── surahs/                        # 114 individual Surah JSON files (surah_1.json to surah_114.json)
│   ├── translations/                  # 16 language translations (JSON)
│   │   ├── bengali.json               ├── malayalam.json
│   │   ├── chinese.json               ├── persian.json
│   │   ├── dutch.json                 ├── portuguese.json
│   │   ├── english.json (Saheeh)      ├── russian.json
│   │   ├── english_clear_quran.json   ├── spanish.json
│   │   ├── french.json                ├── swedish.json
│   │   ├── indonesian.json            ├── turkish.json
│   │   └── italian.json               └── urdu.json
│   └── images/                        # 604 Madani Mushaf page scans (4 styles/resolutions)
│       ├── compact/                   # 604 compact pages (456x672, 1.png - 604.png)
│       ├── colored/                   # 622 full-color pages with borders & Khatm (562x882)
│       ├── high_res/                  # 604 HD pages (1024x1656, 1.png - 604.png)
│       └── standard/                  # 604 medium pages with padded names (512x828, page001.png - page604.png)
│
├── hadith/                            # Prophetic traditions & Hadith books
│   ├── books/                         # Complete 9 Major Hadith Books (Kutub al-Tis'ah)
│   │   ├── bukhari.json               ├── muslim.json            ├── abi_daud.json
│   │   ├── trmizi.json                ├── nasai.json             ├── ibn_maja.json
│   │   ├── malik.json                 ├── ahmed.json             └── darimi.json
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
│       ├── diodrum/                   # Diodrum Arabic (Regular, Medium, Semibold, Bold)
│       ├── hafs/                      # Hafs V20, HafsSmart 08, UthmanicHafs (Regular & Bold)
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
└── api/                               # Islamic APIs & Endpoints Directory
    ├── README.md                      # Complete API reference, cURL commands & params
    └── endpoints.json                 # Machine-readable schema of all 9 services
```

---

## 🚀 Getting Started

### 1. Clone or Download

```bash
git clone https://github.com/mahmoud123-karash/islamic_data.git
```

### 2. Direct CDN Usage (No Clone Needed)

You can load resources directly via GitHub Raw or GitHub Pages CDN:

- **Hadith Books (The 9 Major Collections)**:
  ```text
  https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/hadith/books/bukhari.json
  https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/hadith/books/muslim.json
  ```
- **Quran Surahs & Mushaf Page Scans**:
  ```text
  https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/quran/surahs/surah_1.json
  https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/quran/images/high_res/1.png
  ```
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

## 🌐 Integrated Islamic APIs

A summary of public Islamic APIs cataloged in [`api/endpoints.json`](api/endpoints.json) and documented in [`api/README.md`](api/README.md):

| Service                 | Purpose                            | Provider        | Base URL                                               |
| :---------------------- | :--------------------------------- | :-------------- | :----------------------------------------------------- |
| **Prayer Times**        | Calculations & Monthly Calendar    | AlAdhan         | `https://api.aladhan.com/v1`                           |
| **Reciters**            | Reciters list & Surah recitations  | MP3Quran        | `https://www.mp3quran.net/api/v3`                      |
| **Audio CDN**           | Verse-by-verse & Surah MP3 streams | Islamic Network | `https://cdn.islamic.network`                          |
| **Hadith Encyclopedia** | Thematic hadith categories & Sharh | HadeethEnc      | `https://hadeethenc.com/api/v1`                        |
| **Hadith Books**        | Bukhari, Muslim, Abu Dawud, etc.   | Fawaz Ahmed CDN | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1` |
| **99 Names**            | Asma-ul-Husna with calligraphy     | IslamicAPI      | `https://islamicapi.com/api/v1`                        |
| **Azkar Audio**         | Audio streams for Hisn al-Muslim   | HisnMuslim      | `http://www.hisnmuslim.com/audio/ar`                   |
| **Live Radios**         | 24/7 Quran streaming stations      | Data Rosy       | `https://data-rosy.vercel.app`                         |

---

## 📄 License & Attribution

- **Datasets & Schemas**: Distributed under the permissive [MIT License](LICENSE).
- **Holy Quran Text**: In the public domain. Digital alignments from Tanzil Project & King Fahd Complex.
- **Fonts**:
  - Amiri: [SIL Open Font License 1.1](http://scripts.sil.org/OFL) (Khaled Hosny).
  - Cairo: [SIL Open Font License 1.1](http://scripts.sil.org/OFL) (Mohamed Gaber).
  - Tajawal: [SIL Open Font License 1.1](http://scripts.sil.org/OFL) (Bouchra Salhi).
  - Diodrum Arabic & Uthmanic Hafs (Regular & Bold).
  - QCF Tajweed Fonts: King Fahd Glorious Quran Printing Complex.
- **Tafaseer & Hadith**: Classical Islamic scholarly heritage in the public domain. Nine Hadith books (_Kutub al-Tis'ah_) and Hadith verification references courtesy of Dorar.net.
