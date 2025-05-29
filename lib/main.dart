import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_app/firebase_options.dart';
import 'package:music_app/viewmodels/service_viewmodel.dart';
import 'package:music_app/views/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ServiceViewModel()..fetchServices(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),

      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Bar Example',
      home: BottomNavBarScreen(),
    );
  }
}
