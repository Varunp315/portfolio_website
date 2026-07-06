/*import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/all_projects_page.dart';
import 'screens/project_detail_page.dart';
import 'models/project.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  // Dark/light theme switching removed; app uses a single ThemeData.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Varun Pathak | Portfolio',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      routes: {
        '/projects': (context) => const AllProjectsPage(),
        '/project-detail': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Project;
          return ProjectDetailPage(project: args);
        },
      },
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
        )),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: Scaffold(
        body: HomeScreen(
          toggleTheme: _toggleTheme,
          isDarkMode: _themeMode == ThemeMode.dark,
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/all_projects_page.dart';
import 'screens/project_detail_page.dart';
import 'models/project.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  // Dark/light theme switching removed; app uses a single ThemeData.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Varun Pathak | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // Black + Yellow theme
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFD700), // gold/yellow
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 2,
          titleTextStyle: TextStyle(
            color: Color(0xFFFFD700),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Color(0xFFFFD700)),
        ),
      ),
      routes: {
        '/projects': (context) => const AllProjectsPage(),
        '/project-detail': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Project;
          return ProjectDetailPage(project: args);
        },
      },
      home: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
