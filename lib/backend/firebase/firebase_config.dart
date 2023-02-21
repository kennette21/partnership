import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA0v-xTsejcj4HsfnLxKbq1xUEuis1Tk60",
            authDomain: "partnership-a41dc.firebaseapp.com",
            projectId: "partnership-a41dc",
            storageBucket: "partnership-a41dc.appspot.com",
            messagingSenderId: "628729358523",
            appId: "1:628729358523:web:fd4dfa22eb1248260b219e",
            measurementId: "G-5KDT4LDF69"));
  } else {
    await Firebase.initializeApp();
  }
}
