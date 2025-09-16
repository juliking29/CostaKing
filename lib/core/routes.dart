import 'package:flutter/material.dart';
import '../features/splash/presentation/splash_screen.dart';
import '../features/home/presentation/home_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/splash": (context) => const SplashScreen(),
  "/home": (context) => const HomePage(),
};
