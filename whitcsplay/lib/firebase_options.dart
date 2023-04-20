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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBre1bCl-Qf5KHB4_AaS5Xcxt63lZwlN4Y',
    appId: '1:992322373662:web:375909cfd04a9c9693060f',
    messagingSenderId: '992322373662',
    projectId: 'csplayground-9374c',
    authDomain: 'csplayground-9374c.firebaseapp.com',
    storageBucket: 'csplayground-9374c.appspot.com',
    measurementId: 'G-WCCNXG6BCZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBt3UYGvhKaBNUtFm1d_zxSUd7PLB43lo0',
    appId: '1:992322373662:android:5ef83b9a6f50e7ce93060f',
    messagingSenderId: '992322373662',
    projectId: 'csplayground-9374c',
    storageBucket: 'csplayground-9374c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2WloH8_KuXKroqwqsIX5VPQO1J3CFJk4',
    appId: '1:992322373662:ios:91625c7e13a9878493060f',
    messagingSenderId: '992322373662',
    projectId: 'csplayground-9374c',
    storageBucket: 'csplayground-9374c.appspot.com',
    iosClientId: '992322373662-mcobeucgt0q7rm1sic4bvbh4394e9par.apps.googleusercontent.com',
    iosBundleId: 'WhitCSPlay.org.whitcsplay',
  );
}
