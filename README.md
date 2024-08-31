# Flutter Project Description

## Overview

This Flutter application provides users with a range of features related to Quranic content. The app starts with a splash screen and includes functionalities to access sour (chapters) and ayat (verses), play their audio, mark ayat as favorites, and track the most recently visited sour.

## Features

- **Splash Screen**: A visually engaging splash screen that transitions smoothly to the main content.

- **Get All Sour & Ayat**: 
  - View a comprehensive list of sour and ayat from the Quran.
  - Each ayat can be played with its associated audio for an enhanced reading experience.

- **Favorite Ayat**: 
  - Users can select and mark specific ayat as favorites for quick access later.

- **Home Screen - Latest Sour Visited**: 
  - Displays the most recently visited sour, tracked and stored in a local database for quick reference.

## Technical Details

- **Flutter**: The app is developed using Flutter, a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.

- **Local Storage**:
  - **SharedPreferences**: Used for storing user preferences and simple data such as the most recent sour visited.
  - **Firebase**: Used to store and manage favorite ayat in the cloud for synchronized access across devices.

- **Audio Integration**:
  - Audio files for each ayat are included in the project to provide users with the ability to listen to the verses.

## API Information

### Endpoints

1. **Get All Sour**
   - **Endpoint**: `/api/sour`
   - **Method**: `GET`
   - **Description**: Retrieves a list of all sour available in the Quran. Each sour object contains:
     - A list of ayat (verses).
     - Audio files associated with each ayat.

   - **Response Structure**:
     ```json
     {
       "sour": [
         {
           "sourId": "1",
           "name": "Al-Fatiha",
           "ayat": [
             {
               "ayatId": "1",
               "text": "In the name of Allah, the Most Gracious, the Most Merciful.",
               "audioUrl": "https://example.com/audio/ayat1.mp3"
             },
             // More ayat
           ]
         },
         // More sour
       ]
     }
     ```

## Installation

1. Clone the repository:
   ```bash
   git clone <https://github.com/Ashraf-Khaled-2005/QuranApp.git>
