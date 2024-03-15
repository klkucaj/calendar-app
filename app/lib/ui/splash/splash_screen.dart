import 'package:calendar_app/navigation/app_navigation.dart';
import 'package:calendar_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    // since we don't have anything to load i am just adding 1 second delay
    // i know its not a good user experience but just to show splash screen for 1 second
    await Future.delayed(const Duration(seconds: 1));
    pushReplacement(const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
