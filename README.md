# soil_health_monitoring_app

A simple flutter-based application that connects via Bluetooth to a hand-held device, retrieves temperature and moisture readings of soil. The app integrates with Firebase for authentication and data storage.

### Features
- Authentication - User Login and Signup with Firebase
- Data Management - Records temperature and moisture readings (in the application there are random values as no hardware device was available)
- History Screen - Shows Graphs of temperature and moisture over time
- Report - Display last 3 readings
- Real time sync updates
- Offline caching of data

### Tech Stack Used
1. Flutter (UI Framework)
2. Firebase Authentication
3. Firebase Firestore
4. Provider (State Management)
5. Chart (fl_chart) 

#### App Flow
1. Splash Screen 
2. Login/Signup
3. Home Screen - Test (generates current reading), report(generates last 3 readings)
4. History Screen

#### Assumptions about Bluetooth
- A button is available on home screen 
- real Bluetooth scanning/ pairing not implemented
- Random values are generated for testing and reporting

### APK Link
https://github.com/Ritakshi19/Soil_Health_Monitoring/releases/download/v1.0/app-arm64-v8a-release.apk

