import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Pastikan Provider diimport
import 'screens/started.dart'; // Import Started screen
import 'screens/optionlogin.dart';
import 'provider/auth_provider.dart'; // Pastikan AuthProvider diimport
import 'screens/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // Wrap MyApp dengan ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (_) => AuthProvider(), // Inisialisasi AuthProvider
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(); // Ini adalah deklarasi const, yang tidak bisa diubah

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Started(),
    );
  }
}
