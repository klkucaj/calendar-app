import 'package:calendar_app/navigation/app_navigation.dart';
import 'package:calendar_app/style/theme/app_theme.dart';
import 'package:calendar_app/ui/common/container/app_container.dart';
import 'package:calendar_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalendarApp());
}

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      key: appKey,
      navigatorKey: navKey,
      // i didn't do dark mode customization
      // so i am putting this to light for the moment
      themeMode: ThemeMode.light,
      theme: theme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      builder: (context, child) {
        return AppContainer(
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              devicePixelRatio: 1,
              // for this case i don't want the text to be scales using
              // device text scale
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          ),
        );
      },
    );
  }
}
