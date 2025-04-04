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
    apiKey: 'AIzaSyBar_ni3lfRFG3oURerWCNU_f5ZtGxLXNU',
    appId: '1:1040210310478:web:f1d4edea63e41aa0d35a1f',
    messagingSenderId: '1040210310478',
    projectId: 'resume-e6794',
    authDomain: 'resume-e6794.firebaseapp.com',
    storageBucket: 'resume-e6794.firebasestorage.app',
    measurementId: 'G-G89KGDVENX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAaMGqaelSivhF_DkzcNj-puFJGRdUujQc',
    appId: '1:1040210310478:android:38bebe7df068a071d35a1f',
    messagingSenderId: '1040210310478',
    projectId: 'resume-e6794',
    storageBucket: 'resume-e6794.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3wMLlQMAk9Uik7pd6WSZYrzi_zRa-RXY',
    appId: '1:1040210310478:ios:461ec6cfc0c31d2bd35a1f',
    messagingSenderId: '1040210310478',
    projectId: 'resume-e6794',
    storageBucket: 'resume-e6794.firebasestorage.app',
    iosBundleId: 'com.example.resumeHtml',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3wMLlQMAk9Uik7pd6WSZYrzi_zRa-RXY',
    appId: '1:1040210310478:ios:461ec6cfc0c31d2bd35a1f',
    messagingSenderId: '1040210310478',
    projectId: 'resume-e6794',
    storageBucket: 'resume-e6794.firebasestorage.app',
    iosBundleId: 'com.example.resumeHtml',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBar_ni3lfRFG3oURerWCNU_f5ZtGxLXNU',
    appId: '1:1040210310478:web:fdb1ef57ecf7c185d35a1f',
    messagingSenderId: '1040210310478',
    projectId: 'resume-e6794',
    authDomain: 'resume-e6794.firebaseapp.com',
    storageBucket: 'resume-e6794.firebasestorage.app',
    measurementId: 'G-ST6TFL7ZPS',
  );
}
