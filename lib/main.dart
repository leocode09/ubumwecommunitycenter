import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'footer.dart';
import 'about/about.dart';
import 'contact/contact.dart';
import 'does/does.dart';
import 'partners/partners.dart';
import 'tenders/tenders.dart';
import 'topbar.dart';
import 'home/home.dart';
import 'vision/vision.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ubumwe Community Center',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFf4cf58),
          primary: const Color(0xFF1F3B31),
          secondary: const Color(0xFFFFD966),
          tertiary: const Color(0xFF00A884),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _handleNavigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildPage(int index) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: switch (index) {
        0 => const HomeContent(),
        1 => const AboutContent(),
        2 => const VisionContent(),
        3 => const DoesContent(),
        4 => const PartnersContent(),
        5 => const ContactContent(),
        6 => const TendersContent(),
        _ => const HomeContent(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: TopBar(
          currentIndex: _currentIndex,
          onTap: _handleNavigation,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPage(_currentIndex),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
