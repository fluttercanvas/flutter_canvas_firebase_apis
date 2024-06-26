# Flutter Canvas Firebase APIs

A handy Flutter package for Firebase APIs developed by fluttercanvas.io.

## Getting Started

To use this package and set up Firebase in your Flutter project, follow these steps:

1. **Add Firebase Configuration**:
   - Create a Firebase project on the [Firebase Console](https://console.firebase.google.com/).
   - Add your Android and iOS apps to the project, following the provided setup instructions.

2. **Update Your pubspec.yaml**:
   - In your project's `pubspec.yaml` file, add this package and other required dependencies:

   ```yaml
   dependencies:
     flutter_canvas_firebase_apis: ^0.0.1
     cloud_firestore: ^4.12.2
     firebase_auth: ^4.12.1
     google_sign_in: ^6.1.5

3. **Initialize Firebase Core**:
   - In `main.dart`, inside `main` function initialize Firebase Core using firebaseinit()
   - for example
    ```dart
        firebaseInit();
    ```

For more detailed instructions and examples, refer to the Medium article- https://medium.com/@fluttercanvas/supercharge-your-flutter-app-development-with-our-flutter-canvas-firebase-apis-library-5413ad3b22d8