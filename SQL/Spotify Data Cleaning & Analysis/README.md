# Spotify Data Cleaning & Analysis

## Project Overview
End-to-end data cleaning and business analysis on a 
Spotify-style dataset using MySQL. The project covers 
data quality issues, cleaning techniques and deriving 
actionable business insights from streaming data.

## Dataset
- **Songs table** — 220 rows (110 after cleaning)
- **Streams table** — 250 rows

## Tools Used
- MySQL
- MySQL Workbench

## Data Issues Fixed
- Removed case-variant duplicates
- Standardized text columns to consistent casing
- Replaced string 'NULL' with actual NULL values
- Fixed invalid numeric values (abc, xyz, NULL)
- Converted VARCHAR columns to correct data types

## Business Questions & Insights

1. **Most streamed genre**
   - Pop dominates streams showing widest audience appeal
   - Focus playlist curation around Pop to maximise engagement

2. **Top 5 most streamed artists**
   - A small group of artists drive majority of streams
   - Retaining these artists through exclusive deals is critical

3. **Top streaming country**
   - India leads in stream count indicating a massive user base
   - Localised content and pricing should be prioritised for India

4. **Monthly stream trend**
   - Streams are consistent across months with slight peaks
   - Seasonal campaigns during low months can maintain engagement

5. **Song completion rate**
   - High completion rate songs signal stronger listener satisfaction
   - These songs should be promoted in algorithmic playlists

6. **Premium vs Free behaviour**
   - Premium users show higher stream duration and completion rate
   - Invest in converting Free users through trials and offers

7. **Device usage**
   - Mobile dominates confirming music is consumed on the go
   - Mobile app experience and offline downloads should be prioritised

8. **Top 10 most streamed songs**
   - A handful of songs drive majority of streams
   - These songs should anchor new user onboarding playlists

9. **Highest average popularity score artist**
   - Top popularity artists attract streams across multiple songs
   - Collaborations with these artists boost platform credibility

10. **Stream duration vs song duration by genre**
    - High difference genres indicate users skip before finishing
    - Low difference genres show strong listener retention

## Files
- `songs_cleaning.sql` — Songs table cleaning script
- `streams_cleaning.sql` — Streams table cleaning script
- `business questions analysis.sql` — Business analysis queries
- `README.md` — Project documentation
