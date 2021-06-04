import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:server_catworm/notifiers/theme_notifier.dart';
import 'package:server_catworm/notifiers/terminal_notifier.dart';
import 'package:server_catworm/notifiers/server_cards_notifier.dart';
import 'package:server_catworm/screens/scanner_screen.dart';
import 'package:server_catworm/screens/terminal_screen.dart';
import 'package:server_catworm/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ScannersNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => TerminalNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => ServerCardsNotifier(),
      ),
    ],
    child: Phoenix(
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.grey[900],
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'CAT WORM',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.get() ? darkTheme : lightTheme,
      home: HomeScreen(title: 'CAT WORM'),
      routes: {
        "/home": (context) => ScannerScreen(),
        "/scanner": (context) => ScannerScreen(),
        "/terminal": (context) => TerminalScreen(),
        "/settings": (context) => ScannerScreen(),
      },
    );
  }
}
