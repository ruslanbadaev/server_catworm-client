import 'package:flutter/material.dart';
import 'package:flutter_port_scanner/notifiers/scanner_notifier.dart';
import 'package:flutter_port_scanner/notifiers/theme_notifier.dart';
import 'package:flutter_port_scanner/screens/scanner_screen.dart';
import 'package:flutter_port_scanner/screens/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ScannersNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
      ),
    ],
    child: MyApp(),
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
    primaryColor: Colors.black,
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
      title: 'Port Scanner',
      theme: themeNotifier.get() ? darkTheme : lightTheme,
      home: HomeScreen(title: 'Port Scanner'),
      routes: {
        "/add_post": (context) => ScannerScreen(),
      },
    );
  }
}
