import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC895uBs2ZTeJIAE4RUTdXMFNEmvMX2JGg",
            authDomain: "zendy-ef8e9.firebaseapp.com",
            projectId: "zendy-ef8e9",
            storageBucket: "zendy-ef8e9.firebasestorage.app",
            messagingSenderId: "571317056883",
            appId: "1:571317056883:web:6025e1e53970c328a3c106"));
  } else {
    await Firebase.initializeApp();
  }
}
