// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyA3SRnbYvkB4hBBuebNwc0K4bA-w-0yWXE',
    appId: '1:886465947352:web:744c6c01153f4a950699ad',
    messagingSenderId: '886465947352',
    projectId: 'quranapp-926c6',
    authDomain: 'quranapp-926c6.firebaseapp.com',
    storageBucket: 'quranapp-926c6.appspot.com',
    measurementId: 'G-C9RT93LF3R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZTKoTUhMcIQcSiPXjFptF0EV15aC6CUM',
    appId: '1:886465947352:android:af92dc7bbc4c88b80699ad',
    messagingSenderId: '886465947352',
    projectId: 'quranapp-926c6',
    storageBucket: 'quranapp-926c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPcl6QSP-94_cj-4aWpR8GTy9DeZCV978',
    appId: '1:886465947352:ios:40f7cfb21c9b75c80699ad',
    messagingSenderId: '886465947352',
    projectId: 'quranapp-926c6',
    storageBucket: 'quranapp-926c6.appspot.com',
    iosBundleId: 'com.example.quran',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPcl6QSP-94_cj-4aWpR8GTy9DeZCV978',
    appId: '1:886465947352:ios:40f7cfb21c9b75c80699ad',
    messagingSenderId: '886465947352',
    projectId: 'quranapp-926c6',
    storageBucket: 'quranapp-926c6.appspot.com',
    iosBundleId: 'com.example.quran',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA3SRnbYvkB4hBBuebNwc0K4bA-w-0yWXE',
    appId: '1:886465947352:web:7f78368b0b015aec0699ad',
    messagingSenderId: '886465947352',
    projectId: 'quranapp-926c6',
    authDomain: 'quranapp-926c6.firebaseapp.com',
    storageBucket: 'quranapp-926c6.appspot.com',
    measurementId: 'G-2F6KE8NKNG',
  );
}
