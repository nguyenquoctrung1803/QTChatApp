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
    apiKey: 'AIzaSyD0wAMe6y7-3XzS2a2SO3B23tMZwUrYowI',
    appId: '1:246227073008:web:42fba527bbe3c5d91d0f35',
    messagingSenderId: '246227073008',
    projectId: 'qtchatapp--backend',
    authDomain: 'qtchatapp--backend.firebaseapp.com',
    storageBucket: 'qtchatapp--backend.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABm3Ro_IW7nFejICO1RLoSAw1lHotpRHA',
    appId: '1:246227073008:android:5c271caa87f859d61d0f35',
    messagingSenderId: '246227073008',
    projectId: 'qtchatapp--backend',
    storageBucket: 'qtchatapp--backend.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCi171mfc6Usw5TKyKLEleQxtmwO-bG59U',
    appId: '1:246227073008:ios:746f7d22d6cec0c21d0f35',
    messagingSenderId: '246227073008',
    projectId: 'qtchatapp--backend',
    storageBucket: 'qtchatapp--backend.appspot.com',
    iosClientId:
        '246227073008-5ec2anp1r5uja8i8rh4v04t2mb0qvtk5.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterChatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCi171mfc6Usw5TKyKLEleQxtmwO-bG59U',
    appId: '1:246227073008:ios:746f7d22d6cec0c21d0f35',
    messagingSenderId: '246227073008',
    projectId: 'qtchatapp--backend',
    storageBucket: 'qtchatapp--backend.appspot.com',
    iosClientId:
        '246227073008-5ec2anp1r5uja8i8rh4v04t2mb0qvtk5.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterChatapp',
  );
}
