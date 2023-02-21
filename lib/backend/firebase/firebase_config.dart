import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBYOMbX9uOmA5SVnXGHK_s1T36fYU0oQ9s",
            authDomain: "dev-partnership.firebaseapp.com",
            projectId: "dev-partnership",
            storageBucket: "dev-partnership.appspot.com",
            messagingSenderId: "1001910524628",
            appId: "1:1001910524628:web:8eb1cb734aba0c46a43941",
            measurementId: "G-SFB8JL0F7B"));
  } else {
    await Firebase.initializeApp();
  }
}
