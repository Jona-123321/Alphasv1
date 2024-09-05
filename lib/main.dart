import 'package:alpha_airdrops/home.dart';
import 'package:flutter/material.dart';
import 'package:scaled_app/scaled_app.dart';
/*
void main() {
  runApp(const MyApp());
}
*/

void main() => runApp(const AlphaAirdrops());

class Alphax extends StatelessWidget {
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    onPrimary: Colors.black,
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    secondary: Color(0xFF4D1F7C),
    surface: Color(0xFF1F1929),
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );

  const Alphax({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alpha Airdrops',
        theme: ThemeData(
          colorScheme: lightColorScheme,
          focusColor: Colors.white.withOpacity(0.12),
          useMaterial3: true,
        ),
        home: const AlphaAirdrops());
  }
}
