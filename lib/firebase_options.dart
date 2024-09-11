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
    apiKey: 'AIzaSyDqeVDm-OnHGpdDxDEvW8GOduNM1V598es',
    appId: '1:995151717830:web:88d93aa9dff20e63e17ec7',
    messagingSenderId: '995151717830',
    projectId: 'mentoracademy-task',
    authDomain: 'mentoracademy-task.firebaseapp.com',
    storageBucket: 'mentoracademy-task.appspot.com',
    measurementId: 'G-XT7CZ237RK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANSpa-W65IA6m3eNpoF1ctWulg3XDRsj8',
    appId: '1:995151717830:android:79eab8df5be3c857e17ec7',
    messagingSenderId: '995151717830',
    projectId: 'mentoracademy-task',
    storageBucket: 'mentoracademy-task.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtc0U2a3E8RdW3X5-EJxdM3QBwE0k7CcY',
    appId: '1:995151717830:ios:52593d51b26fe5d3e17ec7',
    messagingSenderId: '995151717830',
    projectId: 'mentoracademy-task',
    storageBucket: 'mentoracademy-task.appspot.com',
    iosBundleId: 'com.example.mentorAcademyTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtc0U2a3E8RdW3X5-EJxdM3QBwE0k7CcY',
    appId: '1:995151717830:ios:52593d51b26fe5d3e17ec7',
    messagingSenderId: '995151717830',
    projectId: 'mentoracademy-task',
    storageBucket: 'mentoracademy-task.appspot.com',
    iosBundleId: 'com.example.mentorAcademyTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDqeVDm-OnHGpdDxDEvW8GOduNM1V598es',
    appId: '1:995151717830:web:5b794e4d9b7a4988e17ec7',
    messagingSenderId: '995151717830',
    projectId: 'mentoracademy-task',
    authDomain: 'mentoracademy-task.firebaseapp.com',
    storageBucket: 'mentoracademy-task.appspot.com',
    measurementId: 'G-PKDEX7DQSB',
  );
}