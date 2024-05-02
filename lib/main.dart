import 'package:flutter/material.dart';
import 'package:renta/login_screens/login_sceen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:renta/profile_screens/profile_screen.dart'; // Yerel dil desteği için

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      supportedLocales: [
        Locale('tr', 'TR'), // Türkçe
        Locale('en', 'US'), // İngilizce
        Locale('sq', 'AL'), // Arnavutça
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: LoginScreen(),
    );
  }
}

