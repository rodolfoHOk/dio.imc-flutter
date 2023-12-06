import 'package:flutter/material.dart';
import 'package:imc_flutter/pages/main_page.dart';
import 'package:google_fonts/google_fonts.dart';

class IMCApp extends StatelessWidget {
  const IMCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.red, foregroundColor: Colors.white)),
      home: const MainPage(),
    );
  }
}
