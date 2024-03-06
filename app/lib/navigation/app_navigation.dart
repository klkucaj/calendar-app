import 'package:flutter/material.dart';

GlobalKey appKey = GlobalKey();
GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

void pushReplacement(Widget screen) => navKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => screen),
      (setting) => false,
    );

Future<T?> push<T>(Widget screen) async =>
    navKey.currentState!.push(MaterialPageRoute(builder: (_) => screen));

Future<void> pop([dynamic data]) => navKey.currentState!.maybePop(data);
