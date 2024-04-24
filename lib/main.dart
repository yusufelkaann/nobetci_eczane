import 'package:flutter/material.dart';
import 'package:nobetci_eczane/providers/search_provider.dart';
import 'package:nobetci_eczane/themes/dark_theme.dart';
import 'package:nobetci_eczane/themes/light_theme.dart';
import 'pages/pharmacy_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SearchProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,

      home: PharmacyPage(),
    );
  }
}