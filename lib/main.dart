import 'package:decla/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// //---------------For IOS Preview /phone on the phone
// // void main() => runApp(
// //       DevicePreview(
// //         enabled: !kReleaseMode,
// //         builder: (context) => MyApp(), // Wrap your app
// //       ),
// //     );

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// // // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       useInheritedMediaQuery: true,
// //       locale: DevicePreview.locale(context),
// //       builder: DevicePreview.appBuilder,
// //       darkTheme: ThemeData.dark(),
// //       home: HomePage(),
// //     );
// //   }

// // -------------------For Android
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCqsOfA-rgfna_FMeMaAT6ruXgxKpTSkpY",
            authDomain: "decla-88200.firebaseapp.com",
            projectId: "decla-88200",
            storageBucket: "decla-88200.appspot.com",
            messagingSenderId: "613171869285",
            appId: "1:613171869285:web:258f57f1506b929efcf88c"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomePage(),
      home: const LoginPage(),
    );
  }
}








































































































































































































































