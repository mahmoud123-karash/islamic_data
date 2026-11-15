# Contributing to Islamic Data

Contributions, corrections, and additional datasets are warmly welcomed!

## Guidelines for Contributions

1. **Accuracy & Authenticity**:
   - Quran text, Tashkeel, Ayah numbering, and Surah boundaries must strictly adhere to authenticated Mushaf standards (e.g., King Fahd Complex).
   - Hadith text, narrators, and authenticity gradings must provide explicit scholarly references (such as Sahih Al-Bukhari, Sahih Muslim, or Dorar.net).
   - Azkar entries should cite references from authentic collections (e.g., Hisn al-Muslim).

2. **File Formats & Structure**:
   - Prefer UTF-8 encoded JSON with consistent key schemas.
   - Retain existing file references so dependent applications do not break.
   - For database files, provide corresponding `.json` or `.csv` exports where possible.

3. **Licensing & Rights**:
   - Only contribute resources with public domain, Creative Commons, SIL OFL, or MIT permissive distribution rights.
   - Do not commit proprietary translations, restricted fonts, or watermarked media.

4. **Pull Request Process**:
   - Create a feature branch for your changes.
   - Validate JSON syntax before opening a pull request:
     ```bash
     python -m json.tool path/to/file.json > /dev/null
     ```
   - Describe the data source and any changes clearly in the pull request description.
