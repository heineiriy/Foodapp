import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/login_screen.dart';
import 'pages/create_account_screen.dart';
import 'pages/home_page.dart';
import 'pages/plants_selection_page.dart';
import 'cart_page.dart';
import 'pages/transaction_page.dart';
import 'pages/messages_page.dart';
import 'pages/account_page.dart';

void main() {
  runApp(const PlantApp());
}

class PlantApp extends StatelessWidget {
  const PlantApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      // Use Material 2 (not Material 3)
      useMaterial3: false,

      // Primary color
      primarySwatch: Colors.green,

      // Color scheme
      colorScheme: ColorScheme.light(
        primary: const Color(0xFF4CAF50),
        secondary: const Color(0xFF8BC34A),
        surface: const Color(0xFFF5F5F5),
        error: const Color(0xFFD32F2F),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onError: Colors.white,
      ),

      // Scaffold background: make transparent so global background image shows
      scaffoldBackgroundColor: Colors.transparent,

      // App bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF4CAF50),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      // Fixed Card Theme - Simple version
      cardTheme: CardThemeData(
        color: Colors.white.withOpacity(0.92), // slight translucency
        elevation: 2.0,
        margin: const EdgeInsets.all(8.0),
      ),

      // Text theme for better readability
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black87),
        bodyMedium: TextStyle(color: Colors.black87),
        labelLarge: TextStyle(color: Colors.black87),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2.0),
        ),
      ),

      // Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        ),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Shop',
      theme: themeData,
      builder: (context, child) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },

      // Initial route
      initialRoute: '/splash',

      // Routes
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/createAccount': (context) => const CreateAccountScreen(),
        '/home': (context) => const HomePage(),
        '/plants': (context) => const PlantsSelectionPage(),
        '/cart': (context) => const CartPage(),
        '/transaction': (context) => const TransactionPage(),
        '/messages': (context) => const MessagesPage(),
        '/account': (context) => const AccountPage(),
      },
    );
  }
}
