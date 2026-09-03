import 'package:flutter/material.dart';
import 'telas/tela_diario.dart';

void main() => runApp(const MenteLeveApp());

class MenteLeveApp extends StatelessWidget {
  const MenteLeveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MenteLeve',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D6F)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2E7D6F),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const TelaDiario(),
    );
  }
}
