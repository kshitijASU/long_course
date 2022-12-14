// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAp5kKydtdBqsQ00O4nPYI9Zqka67jGURw',
    appId: '1:369141858598:web:2122abb7b06c4f962a81e7',
    messagingSenderId: '369141858598',
    projectId: 'my-long-course-flutter-project',
    authDomain: 'my-long-course-flutter-project.firebaseapp.com',
    storageBucket: 'my-long-course-flutter-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpPJ0w5qjgdB0WdYtU7vHOHcFrgJ02l-k',
    appId: '1:369141858598:android:c7446452362985c82a81e7',
    messagingSenderId: '369141858598',
    projectId: 'my-long-course-flutter-project',
    storageBucket: 'my-long-course-flutter-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBk9XIe8-2j6MRARBlMTEjFjDTMvpuCPdc',
    appId: '1:369141858598:ios:391f5f9a298d516c2a81e7',
    messagingSenderId: '369141858598',
    projectId: 'my-long-course-flutter-project',
    storageBucket: 'my-long-course-flutter-project.appspot.com',
    iosClientId: '369141858598-27mhtbn4e37bt4tpiab24pe6is8o6b72.apps.googleusercontent.com',
    iosBundleId: 'com.example.longCourseProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBk9XIe8-2j6MRARBlMTEjFjDTMvpuCPdc',
    appId: '1:369141858598:ios:391f5f9a298d516c2a81e7',
    messagingSenderId: '369141858598',
    projectId: 'my-long-course-flutter-project',
    storageBucket: 'my-long-course-flutter-project.appspot.com',
    iosClientId: '369141858598-27mhtbn4e37bt4tpiab24pe6is8o6b72.apps.googleusercontent.com',
    iosBundleId: 'com.example.longCourseProject',
  );
}
