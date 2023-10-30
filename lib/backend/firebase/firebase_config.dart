import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC8da6cnmx3mVCWaVgVCtqExIoAYAoszfM",
            authDomain: "ai-headshot-75c55.firebaseapp.com",
            projectId: "ai-headshot-75c55",
            storageBucket: "ai-headshot-75c55.appspot.com",
            messagingSenderId: "213218083810",
            appId: "1:213218083810:web:c37617ce48e5ee596b6fbb",
            measurementId: "G-XWNBM58P2Z"));
  } else {
    await Firebase.initializeApp();
  }
}
