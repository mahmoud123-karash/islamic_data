# 🌐 Islamic App APIs & Endpoints Reference

A complete reference guide for all external REST APIs, audio streaming CDNs, and data endpoints used in modern Islamic applications.

---

## 📑 Index of Services

1. [Prayer Times & Hijri Calendar (AlAdhan API)](#1-prayer-times--hijri-calendar-aladhan-api)
2. [Quran Audio & Reciters (MP3Quran API)](#2-quran-audio--reciters-mp3quran-api)
3. [Verse & Surah Audio CDN (Islamic Network)](#3-verse--surah-audio-cdn-islamic-network)
4. [Hadith Encyclopedia (HadeethEnc API)](#4-hadith-encyclopedia-hadeethenc-api)
5. [Canonical Hadith Books API (Fawaz Ahmed / jsDelivr)](#5-canonical-hadith-books-api-fawaz-ahmed--jsdelivr)
6. [99 Names of Allah (IslamicAPI)](#6-99-names-of-allah-islamicapi)
7. [Hisn al-Muslim Supplications Audio](#7-hisn-al-muslim-supplications-audio)
8. [Live Islamic Radios Streaming](#8-live-islamic-radios-streaming)
9. [Islamic Data Raw & Pages CDN](#9-islamic-data-raw--pages-cdn)

---

## 1. Prayer Times & Hijri Calendar (AlAdhan API)

- **Base URL:** `https://api.aladhan.com/v1`
- **Documentation:** [https://aladhan.com/prayer-times-api](https://aladhan.com/prayer-times-api)
- **Auth:** None required

### A. Monthly Calendar by Coordinates
Calculates daily prayer timings (Fajr, Sunrise, Dohar, Asr, Sunset, Maghrib, Isha, Imsak) for an entire month based on latitude and longitude coordinates.

- **Method:** `GET`
- **Endpoint:** `/calendar/{year}/{month}`
- **Parameters:**
  - `year` (path, integer): 4-digit year (e.g. `2026`)
  - `month` (path, integer): Month number `1` to `12`
  - `latitude` (query, float): Latitude in decimal degrees
  - `longitude` (query, float): Longitude in decimal degrees
  - `method` (query, integer): Calculation authority:
    - `5`: Egyptian General Authority of Survey
    - `4`: Umm Al-Qura University, Makkah
    - `3`: Muslim World League (MWL)
    - `2`: Islamic Society of North America (ISNA)
    - `1`: University of Islamic Sciences, Karachi
- **Example Request:**
  ```bash
  curl -X GET "https://api.aladhan.com/v1/calendar/2026/11?latitude=30.0444&longitude=31.2357&method=5"
  ```

### B. Monthly Calendar by City
- **Method:** `GET`
- **Endpoint:** `/calendarByCity/{year}/{month}`
- **Parameters:** `city`, `country`, `method`
- **Example Request:**
  ```bash
  curl -X GET "https://api.aladhan.com/v1/calendarByCity/2026/11?city=Cairo&country=Egypt&method=5"
  ```

### C. Gregorian to Hijri Date Conversion
- **Method:** `GET`
- **Endpoint:** `/gToH/{date}`
- **Parameters:** `date` (path, string): Format `DD-MM-YYYY`
- **Example Request:**
  ```bash
  curl -X GET "https://api.aladhan.com/v1/gToH/15-11-2026"
  ```

---

## 2. Quran Audio & Reciters (MP3Quran API)

- **Base URL:** `https://www.mp3quran.net/api/v3`
- **Documentation:** [https://mp3quran.net/api/v3](https://mp3quran.net/api/v3)
- **Auth:** None required

### A. List All Reciters & Riwayahs
Returns complete list of reciters, their audio servers, available surahs, and recitations (Hafs, Warsh, Qalun, etc.).

- **Method:** `GET`
- **Endpoint:** `/reciters`
- **Parameters:**
  - `language` (query, string): `ar` or `en`
- **Example Request:**
  ```bash
  curl -X GET "https://www.mp3quran.net/api/v3/reciters?language=ar"
  ```

### B. Chapter Recitations by Reciter
- **Method:** `GET`
- **Endpoint:** `/chapter_recitations/{reciterId}`
- **Parameters:**
  - `reciterId` (path, integer): ID of reciter
  - `language` (query, string): `ar` or `en`
- **Example Request:**
  ```bash
  curl -X GET "https://www.mp3quran.net/api/v3/chapter_recitations/54?language=ar"
  ```

---

## 3. Verse & Surah Audio CDN (Islamic Network)

- **Base URL:** `https://cdn.islamic.network`
- **Auth:** None required

### A. Verse-by-Verse Audio Stream
Allows precise word-by-word or verse-by-verse audio playback for synchronization with Mushaf reading.

- **Method:** `GET`
- **Endpoint:** `/quran/audio/{bitrate}/{reciterIdentifier}/{verseNumber}.mp3`
- **Parameters:**
  - `bitrate`: `64` or `128`
  - `reciterIdentifier`: Reciter code (e.g. `ar.alafasy`, `ar.abdulbasitmurattal`, `ar.minshawi`)
  - `verseNumber`: Global verse index (`1` to `6236`)
- **Example URL:**
  ```text
  https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3
  ```

### B. Surah-by-Surah Audio Stream
- **Method:** `GET`
- **Endpoint:** `/quran/audio-surah/{bitrate}/{reciterIdentifier}/{surahNumber}.mp3`
- **Parameters:**
  - `surahNumber`: Surah number (`1` to `114`)
- **Example URL:**
  ```text
  https://cdn.islamic.network/quran/audio-surah/128/ar.alafasy/1.mp3
  ```

---

## 4. Hadith Encyclopedia (HadeethEnc API)

- **Base URL:** `https://hadeethenc.com/api/v1`
- **Documentation:** [https://hadeethenc.com/en/api/docs](https://hadeethenc.com/en/api/docs)
- **Auth:** None required

### A. Categories List
Returns thematic trees (e.g., Creed, Ethics, Prayer, Manners).

- **Method:** `GET`
- **Endpoint:** `/categories/list/?language={lang}`
- **Example Request:**
  ```bash
  curl -X GET "https://hadeethenc.com/api/v1/categories/list/?language=ar"
  ```

### B. Hadiths in Category
- **Method:** `GET`
- **Endpoint:** `/hadeeths/list/?language={lang}&category_id={id}&page={page}&per_page={count}`
- **Example Request:**
  ```bash
  curl -X GET "https://hadeethenc.com/api/v1/hadeeths/list/?language=ar&category_id=1&page=1&per_page=20"
  ```

### C. Single Hadith Details & Explanation
Returns the full text, narrator, isnad, grade, and scholarly commentary (*Sharh*).

- **Method:** `GET`
- **Endpoint:** `/hadeeths/one/?language={lang}&id={hadithId}`
- **Example Request:**
  ```bash
  curl -X GET "https://hadeethenc.com/api/v1/hadeeths/one/?language=ar&id=2942"
  ```

---

## 5. Canonical Hadith Books API (Fawaz Ahmed / jsDelivr)

- **Base URL:** `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1`
- **Documentation:** [https://github.com/fawazahmed0/hadith-api](https://github.com/fawazahmed0/hadith-api)
- **Auth:** None required

Provides fast, CDN-cached JSON editions of the Kutub al-Sittah and other major Hadith compilations:

| Collection | Endpoint URL |
| :--- | :--- |
| **Editions Index** | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions.min.json` |
| **Sahih Al-Bukhari** | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-bukhari.min.json` |
| **Sahih Muslim** | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-muslim.min.json` |
| **Sunan Abi Dawud** | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-abudawud.min.json` |
| **Jami` at-Tirmidhi** | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-tirmidhi.min.json` |
| **Sunan an-Nasa'i** | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-nasai.min.json` |
| **Sunan Ibn Majah** | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-ibnmajah.min.json` |
| **Muwatta Malik** | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-malik.min.json` |
| **Forty Hadith Nawawi** | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-nawawi.min.json` |
| **Forty Hadith Qudsi** | `https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/ara-qudsi.min.json` |

---

## 6. 99 Names of Allah (IslamicAPI)

- **Base URL:** `https://islamicapi.com/api/v1`
- **Endpoint:** `/asma-ul-husna/`
- **Auth:** Required (`api_key` query parameter)
- **Parameters:**
  - `language`: `ar` or `en`
  - `api_key`: Developer API key
- **Example Request:**
  ```bash
  curl -X GET "https://islamicapi.com/api/v1/asma-ul-husna/?language=ar&api_key=YOUR_API_KEY"
  ```

---

## 7. Hisn al-Muslim Supplications Audio

- **Base URL:** `http://www.hisnmuslim.com/audio/ar`
- **Pattern:** `/ar_7esn_AlMoslem_by_Doors_{doorNumber}.mp3`
- **Parameters:**
  - `doorNumber`: 3-digit padded number matching category index (e.g. `001`, `002`, `028`)
- **Example URL:**
  ```text
  http://www.hisnmuslim.com/audio/ar/ar_7esn_AlMoslem_by_Doors_001.mp3
  ```

---

## 8. Live Islamic Radios Streaming

- **Catalog Endpoint:** `https://data-rosy.vercel.app/radio.json` (and bundled in `multimedia/radio.json`)
- **Auth:** None required
- **Description:** Provides continuous HTTP live audio streams for Holy Quran recitations and Islamic radio stations worldwide.

---

## 9. Islamic Data Raw & Pages CDN

The assets stored in this repository are available via global CDN mirrors:

### A. Tafseer JSON Direct Downloads
```text
https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/assets/tafaseer/{bookFileName}
https://mahmoud123-karash.github.io/islamic_data/assets/tafaseer/{bookFileName}
```
Available files: `ar_muyassar.json`, `sa3dy.json`, `katheer.json`, `baghawy.json`, `qortoby.json`, `tabary.json`, `tanweer.json`, `waseet.json`, `e3rab.json`, `ar_ma3any.json`.

### B. QCF Tajweed Compressed Font Pages
```text
https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/assets/fonts/qcf_tajweed/QCF4{page:03d}_COLOR-Regular.ttf.gz
https://mahmoud123-karash.github.io/islamic_data/assets/fonts/qcf_tajweed/QCF4{page:03d}_COLOR-Regular.ttf.gz
```
Example for Page 1:
```text
https://raw.githubusercontent.com/mahmoud123-karash/islamic_data/main/assets/fonts/qcf_tajweed/QCF4001_COLOR-Regular.ttf.gz
```
