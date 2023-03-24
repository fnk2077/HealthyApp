import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD-Cepr3Orf7u2HE2HXzOAHMooHqlLtL30",
            authDomain: "good-healthy.firebaseapp.com",
            projectId: "good-healthy",
            storageBucket: "good-healthy.appspot.com",
            messagingSenderId: "831389450316",
            appId: "1:831389450316:web:ad25aa24d81dc4a58fb4e9",
            measurementId: "G-K3D5WPYCV9"));
  } else {
    await Firebase.initializeApp();
  }
}
