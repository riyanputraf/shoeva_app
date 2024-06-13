# Shamo App

![App Screenshot](images/project_cover/project_cover.png)

## Description

Shamo App is an e-commerce application for selling shoes built using Flutter. This application uses Laravel as a backend for storing shoes data and Firebase for storing and message management.

## Feature

- User authentication (Login and Register)
- Product list display
- Product details
- Shopping cart
- Checkout process
- Chat with the seller
- Message management with Firebase

## Tech

- Flutter
- State Management Provider
- Laravel 
- MySQL
- Firebase

## Installation

1. Clone this repository

   ```bash
   git clone https://github.com/riyanputraf/shamo_app.git
   ```
2. Go into the folder
   ```bash  
   cd shamo_app
   ```
3. Install Flutter dependencies
   ```bash  
   flutter pub get
   ```
4. Firebase configuration
   - Create a project in Firebase Console
   - Select Flutter Platform
   - Install the Firebase CLI
   - Run FlutterFire CLI on terminal
      ```bash
      dart pub global activate flutterfire_cli
      ```
   - Run command at the root of your Flutter project directory
     ```bash
      flutterfire configure
      ```
   - Follow configuration instruction
   - Initialize Firebase
     ```javascript
      import 'package:firebase_core/firebase_core.dart';
      import 'firebase_options.dart';
      
      // ...
      
      Future<void> main() async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        runApp(const MyApp());
      }
      ```
5. Run the Flutter application
   ```bash  
   flutter run
   ```

