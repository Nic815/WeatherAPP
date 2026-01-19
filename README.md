# WeatherAPP 🌤️

WeatherAPP is a modern iOS weather application built with SwiftUI, Supabase authentication, and OpenWeather APIs.  
The app demonstrates AI-assisted development, clean architecture, and a premium glass-style UI.

## Features
- Email & password authentication (Supabase)
- Current weather using user location
- City search & favorites
- 5-day forecast
- Temperature unit toggle (°C / °F)
- Premium glassmorphism UI

## Tech Stack
- SwiftUI
- MVVM architecture
- Supabase (Auth + Database)
- OpenWeather API
- CoreLocation
- AI-assisted development (Claude / ChatGPT)

## Screenshots

### Login Screen
Email and password based authentication using Supabase.  
The screen uses a clean glass-style UI with a focus on simplicity and clarity.

<img
  src="https://github.com/user-attachments/assets/0d3390cb-4499-441f-9974-5154c27efc4d"
  alt="Login Screen"
  width="300"
/>




---

### Home Screen (Current Location Weather)
Displays the current weather based on the user’s location, including temperature, weather condition, and a 5-day forecast.  
The app title dynamically updates to show the city name.

<img
  src="https://github.com/user-attachments/assets/c74db84d-2c13-4e05-9365-67d5a41f84ba"
  alt="Home Screen"
  width="300"
/>



---

### City Search
Allows users to search for cities using the OpenWeather Geo API.  
Duplicate city results are handled properly, and selecting a city loads its weather on the home screen.


<img
  src="https://github.com/user-attachments/assets/05fc2a2f-83f1-49eb-8e50-55092e871342"
  alt="City Search"
  width="300"
/>



---

### Favorites
Shows the list of saved favorite cities.  
Selecting a city instantly navigates back to the home screen and displays the current weather.

<img
  src="https://github.com/user-attachments/assets/118222bb-0f11-4b84-8edd-f6cae1fb8dda"
  alt="Favorites"
  width="300"
/>

---

### Settings
Users can change the temperature unit (°C / °F) and sign out.  
The screen follows the same premium glass-style design language as the rest of the app.

<img
  src="https://github.com/user-attachments/assets/8070fa5b-9fc1-421c-a3aa-b6dee4c02ce0"
  alt="Settings"
  width="300"
/>

---

## Demo Video

A short screen recording demonstrating the complete app flow.

**The video includes:**
- App overview and navigation
- Supabase login flow
- City search and favorites workflow
- Settings and temperature unit toggle

🎥 **Demo Video Link:**  
https://drive.google.com/file/d/1Hsm1BKszXAXfTC3PRR4w_Eojs7cYvw0M/view?usp=drive_link



## Setup Instructions

### 1. Clone the repo
```
git clone https://github.com/Nic815/WeatherAPP.git
```
### 2. Open in Xcode
```
open Glasscast.xcodeproj
```
## 3. Configure Supabase

1. Create a project at https://supabase.com  
2. Go to **Authentication → Providers**  
3. Enable **Email / Password** authentication  

Copy the following from **Settings → API**:
- **Project URL**
- **anon public key**

Add them to `SupabaseService.swift` (or `Secrets.plist` if refactored):

```
let supabaseURL = URL(string: "https://your-project-id.supabase.co")!
let supabaseKey = "your-anon-public-key"
```
## 4. Configure OpenWeather

1. Create an account at https://openweathermap.org

2. Generate an API key from the dashboard

3. Add the API key to:

(a) WeatherService.swift

(b) CitySearchService.swift

## 5. Run the App

# Requirements

1. iOS 17+

2. Xcode 15+

3. Simulator or physical iPhone

# Steps:

1.Open the project in Xcode

2. Select a simulator or connected device

3. Press Run (⌘R)



---

# AI Usage Context – Glasscast

This project was developed with the help of AI tools such as Claude and ChatGPT throughout the development process. AI was used as a supporting tool to speed up development, explore design ideas, and troubleshoot issues, while all final decisions and implementations were made and verified manually.

## How AI Was Used

AI assistance was used in multiple areas of the project, including:
- Designing SwiftUI screens with a clean, premium glass-style UI
- Helping structure the app using MVVM architecture
- Integrating Supabase authentication (email/password login)
- Implementing CoreLocation to fetch the user’s current location
- Debugging complex Xcode build and runtime errors
- Improving overall UX and code readability

## Development Workflow

1. AI was first used to scaffold the initial project structure, views, and services.
2. The UI was then refined iteratively with AI suggestions to improve spacing, hierarchy, and visual polish.
3. During development, several build and runtime issues occurred. AI helped interpret error messages, logs, and Xcode configuration problems.
4. AI suggestions were not blindly followed; they were reviewed, tested, and modified when necessary.
5. Final implementations were validated manually to ensure correctness and stability.

## Reflection on AI Usage

AI was especially helpful for:
- Rapid prototyping and speeding up repetitive tasks
- Explaining cryptic Xcode and Swift errors in simple terms
- Suggesting SwiftUI best practices and architectural improvements

At the same time, critical thinking was required to evaluate AI output, handle edge cases, and make final technical decisions. AI acted as a productivity booster rather than a replacement for manual development and problem-solving.
