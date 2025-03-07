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
    apiKey: 'AIzaSyBYw_ho0EY3w_E0UweBg58r4zJ33oDKRWA',
    appId: '1:684736173363:web:e720c6bb2f927d9d5e1a46',
    messagingSenderId: '684736173363',
    projectId: 'storeappdamo2024-a1eba',
    authDomain: 'storeappdamo2024-a1eba.firebaseapp.com',
    databaseURL: 'https://storeappdamo2024-a1eba-default-rtdb.firebaseio.com',
    storageBucket: 'storeappdamo2024-a1eba.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmYHtu6L8JS-3PfLXz3lXgXb38kZ4_yXY',
    appId: '1:684736173363:android:fc72f0df9eaafc5f5e1a46',
    messagingSenderId: '684736173363',
    projectId: 'storeappdamo2024-a1eba',
    databaseURL: 'https://storeappdamo2024-a1eba-default-rtdb.firebaseio.com',
    storageBucket: 'storeappdamo2024-a1eba.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgeTZiN3ZpAkBpC0cgoTD35pSyIFGxcxY',
    appId: '1:684736173363:ios:8f9780cf3001d29d5e1a46',
    messagingSenderId: '684736173363',
    projectId: 'storeappdamo2024-a1eba',
    databaseURL: 'https://storeappdamo2024-a1eba-default-rtdb.firebaseio.com',
    storageBucket: 'storeappdamo2024-a1eba.firebasestorage.app',
    iosBundleId: 'com.example.appstore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgeTZiN3ZpAkBpC0cgoTD35pSyIFGxcxY',
    appId: '1:684736173363:ios:8f9780cf3001d29d5e1a46',
    messagingSenderId: '684736173363',
    projectId: 'storeappdamo2024-a1eba',
    databaseURL: 'https://storeappdamo2024-a1eba-default-rtdb.firebaseio.com',
    storageBucket: 'storeappdamo2024-a1eba.firebasestorage.app',
    iosBundleId: 'com.example.appstore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBYw_ho0EY3w_E0UweBg58r4zJ33oDKRWA',
    appId: '1:684736173363:web:ad66ded6e3c2e4195e1a46',
    messagingSenderId: '684736173363',
    projectId: 'storeappdamo2024-a1eba',
    authDomain: 'storeappdamo2024-a1eba.firebaseapp.com',
    databaseURL: 'https://storeappdamo2024-a1eba-default-rtdb.firebaseio.com',
    storageBucket: 'storeappdamo2024-a1eba.firebasestorage.app',
  );
}
