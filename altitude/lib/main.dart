import 'package:flutter/material.dart';

import 'package:lasttry/presentation/pages/home_page.dart';
import 'package:lasttry/presentation/screen_home.dart';

void main() {
  runApp(const CyberHeightApp());
}

class CyberHeightApp extends StatelessWidget {
  const CyberHeightApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALTITUDE',
      theme: ThemeData.light(),
      home: const ScreenSplash(),
    );
  }
}