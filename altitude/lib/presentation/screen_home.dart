import 'package:flutter/material.dart';
import 'package:lasttry/presentation/pages/home_page.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    waitSplash();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black, // AMOLED black
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120, // Reduced logo size
                  width: 120,
                  child: Image(image: AssetImage('assets/Loading.gif')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  waitSplash() async {
    await Future.delayed(Duration(seconds: 4));
    if (!mounted) return;
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}