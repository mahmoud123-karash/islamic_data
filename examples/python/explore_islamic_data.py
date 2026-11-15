#!/usr/bin/env python3
"""
Explore Islamic Data Repository
Demonstrates how to load and query Quran, Hadith, Azkar, and Tafseer data using Python.
"""

import os
import json

BASE_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

def load_json(rel_path):
    full_path = os.path.join(BASE_DIR, rel_path)
    with open(full_path, "r", encoding="utf-8") as f:
        return json.load(f)

def main():
    print("=" * 60)
    print("  Islamic Data Repository - Quick Exploration")
    print("=" * 60)

    # 1. Quran Verses & Surahs
    surahs = load_json("quran/surahs.json")
    quran = load_json("quran/quran.json")
    print(f"\n[+] Total Surahs loaded: {len(surahs)}")
    print(f"[+] Total Quran Ayahs loaded: {len(quran)}")

    first_ayah = quran[0]
    print(f"    First Ayah: {first_ayah['aya_text'].strip()} (Surah {first_ayah['sora_name_ar']})")

    # 2. Search Quran Verses
    keyword = "الصبر"
    matches = [a for a in quran if keyword in a['aya_text_emlaey']]
    print(f"\n[+] Search for '{keyword}': found {len(matches)} occurrences")
    if matches:
        sample = matches[0]
        print(f"    Sample: {sample['sora_name_ar']} - Verse {sample['aya_no']}: {sample['aya_text'].strip()}")

    # 3. An-Nawawi Forty Hadith
    nawawi = load_json("hadith/nawawi_forty.json")
    print(f"\n[+] An-Nawawi Hadith count: {len(nawawi)}")
    first_hadith = nawawi[0]
    print(f"    Hadith #1: {first_hadith['title']}")
    print(f"    Narrator: {first_hadith['narrator']}")

    # 4. Azkar Categories
    azkar = load_json("azkar/azkar.json")
    print(f"\n[+] Azkar categories count: {len(azkar)}")
    print("    Sample categories:")
    for cat in azkar[:3]:
        print(f"      - ID {cat['id']}: {cat['category']} ({len(cat.get('array', []))} items)")

    # 5. Tafseer
    muyassar = load_json("assets/tafaseer/ar_muyassar.json")
    print(f"\n[+] Tafseer Al-Muyassar Ayahs: {len(muyassar)}")
    print(f"    Ayah 1 Tafseer: {muyassar[0]['text']}")

    # 6. Reciters & Audio
    reciters = load_json("multimedia/reciters.json")
    print(f"\n[+] Reciters available: {len(reciters)}")
    for r in reciters[:3]:
        print(f"      - {r.get('name')} ({r.get('englishName')})")

    # 7. APIs & Endpoints Directory
    api_dir = load_json("api/endpoints.json")
    services = api_dir.get("services", [])
    print(f"\n[+] Integrated Islamic APIs & Services: {len(services)}")
    for s in services:
        print(f"      - {s['name']} ({len(s.get('endpoints', []))} endpoints) -> {s['baseUrl']}")

    print("\n" + "=" * 60)
    print("All resources verified successfully!")
    print("=" * 60)

if __name__ == "__main__":
    main()
