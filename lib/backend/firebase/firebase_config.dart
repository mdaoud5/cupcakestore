import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAJDD5CghajP7XIBCPZe-q-_pp4woFnTZc",
            authDomain: "cupcakestore-90629.firebaseapp.com",
            projectId: "cupcakestore-90629",
            storageBucket: "cupcakestore-90629.appspot.com",
            messagingSenderId: "416461349439",
            appId: "1:416461349439:web:c8d65f6b69e423dab34e8a",
            measurementId: "G-GXTLWG5RMD"));
  } else {
    await Firebase.initializeApp();
  }
}
