import 'package:flutter/material.dart';

import '../pages/my_home_pages.dart';
import '../theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DoDidDoneThemeData.lightTheme, // Use the defined theme
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

