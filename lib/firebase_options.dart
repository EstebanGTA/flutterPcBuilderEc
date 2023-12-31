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
    apiKey: 'AIzaSyBh-WdfAC96BPJ_6bXymrZfE2I58SAN8SU',
    appId: '1:851810073047:web:c979bc7e0ed054e7bab392',
    messagingSenderId: '851810073047',
    projectId: 'flutterpcbuilderec',
    authDomain: 'flutterpcbuilderec.firebaseapp.com',
    storageBucket: 'flutterpcbuilderec.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD51JRR7pEjrWZRoSR8MJUJXr_nDYLVTns',
    appId: '1:851810073047:android:a53b88dd67902238bab392',
    messagingSenderId: '851810073047',
    projectId: 'flutterpcbuilderec',
    storageBucket: 'flutterpcbuilderec.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8OsZoQWCLCG0mkPry_j-rYW5cxw1fjWg',
    appId: '1:851810073047:ios:15342bf747c52853bab392',
    messagingSenderId: '851810073047',
    projectId: 'flutterpcbuilderec',
    storageBucket: 'flutterpcbuilderec.appspot.com',
    iosBundleId: 'com.example.pcbuilderec',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8OsZoQWCLCG0mkPry_j-rYW5cxw1fjWg',
    appId: '1:851810073047:ios:6cae2c775bd7db2bbab392',
    messagingSenderId: '851810073047',
    projectId: 'flutterpcbuilderec',
    storageBucket: 'flutterpcbuilderec.appspot.com',
    iosBundleId: 'com.example.pcbuilderec.RunnerTests',
  );
}
