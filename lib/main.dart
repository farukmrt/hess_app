import 'package:flutter/material.dart';

import 'package:hess_app/widgets/giderler.dart';

var kRenkSemasi = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 0, 255, 170),
);

var kKoyuRenkSemasi = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kKoyuRenkSemasi,
        cardTheme: const CardTheme().copyWith(
          color: kKoyuRenkSemasi.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 6,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kKoyuRenkSemasi.primaryContainer,
            foregroundColor: kKoyuRenkSemasi.onPrimaryContainer,
          ),
        ),
      ),

      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kRenkSemasi,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kRenkSemasi.onPrimaryContainer,
          foregroundColor: kRenkSemasi.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kRenkSemasi.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 6,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kRenkSemasi.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kRenkSemasi.onSecondaryContainer,
                  fontSize: 16),
            ),
      ),
      //themeMode: ThemeMode.system,    //varsayilan olarak default geliyor
      home: const giderler(),
    ),
  );
}
